HI Patrick,

Here is the trigger that fires off when an image is scanned/attached.

You will see that there is a global registry key (INF_SUPPRESS_IMAGING), along with global registry values keys (INF_INTERFACED_FORM_TYPE_CD and INF_OUT_EXTENSION_ALLOWED), that must be configured to send that outbound.  That setup will  need to be mimicked at CRMC.

And make sure that record routing it set up in the SISLNK.RECORD_ROUTING table for the new interface.

Hope this helps.  Let me know if you need anything else.

ALTER TRIGGER [dbo].[PAT_IMAGE_INSERT] ON [dbo].[PAT_IMAGE] 
FOR INSERT 
AS
       
SET NOCOUNT ON

declare @URN                      URN
declare @VISIT_NO                 VISIT_NO
declare @IMAGE_FNAME              FILENAME
declare @FORM_TYPE_CD             FORM_TYPE_CD
declare @SEQ_NUM                  int
declare @FORM_OVERLAY_FLG BOOL
declare @Suppress                 varchar(255)
declare @FileExt                  varchar(10)
declare @FileExtDeclared   int
declare @FormTypeDeclared  int

SELECT @Suppress = value1 FROM global_registry WHERE registry_key = 'INF_SUPPRESS_IMAGING'

IF (@Suppress = '0' OR @Suppress IS NULL)
BEGIN

       select        @URN                 = URN, 
              @VISIT_NO                  = VISIT_NO, 
              @IMAGE_FNAME         = IMAGE_FNAME,
              @FORM_TYPE_CD              = FORM_TYPE_CD,
              @SEQ_NUM                   = SEQ_NUM
              from inserted

       select @FORM_OVERLAY_FLG = FORM_OVERLAY_FLG from FORM_TYPE_MSTR
       where FORM_TYPE_CD = @FORM_TYPE_CD

       set @FormTypeDeclared = (select count(*) from global_registry_values where registry_key = 'INF_INTERFACED_FORM_TYPE_CD')
       set @FileExtDeclared = (select count(*) from global_registry_values where registry_key = 'INF_OUT_EXTENSION_ALLOWED')

       -- Add 1 to compensate for period between file and extension
       set @FileExt = (select SUBSTRING(@IMAGE_FNAME, PATINDEX('%.%', @IMAGE_FNAME), (LEN(@IMAGE_FNAME) - PATINDEX('%.%', @IMAGE_FNAME) + 1)))

       -- If no file extensions are setup in GOLBAL_REGISTRY_VALUES then send out all extensions
       if exists (select * from global_registry_values where registry_key = 'INF_OUT_EXTENSION_ALLOWED' and value = @FileExt) or @FileExtDeclared = 0
       BEGIN
              -- Specific form types can also be denied.  If none of them are declared then we will send out all Form Types
              if exists (select * from global_registry_values where registry_key = 'INF_INTERFACED_FORM_TYPE_CD' and value = @FORM_TYPE_CD) or @FormTypeDeclared = 0
              BEGIN
                     if(@FORM_OVERLAY_FLG = 0)
                           INSERT INTO dbo.INF_TRIGGER
                           (CREATE_DATE, MSG)
                           values( GETDATE(),
                                  '<NEW_IMAGE pat_id="' +
                                  convert(varchar(20), @URN) +
                                  '" visit_id="'+
                                  ISNULL(@VISIT_NO, '') + 
                                  '" file_name="' +
                                  @IMAGE_FNAME +
                                  '" form_type="' +
                                  @FORM_TYPE_CD +
                                  '" seq_num="' +
                                  convert(varchar(20), @SEQ_NUM)  +
                                  '"/>'
                                  )
              END
       END
END



Kyle Maasen
RCM Team Lead
636.764.5069 | Office
