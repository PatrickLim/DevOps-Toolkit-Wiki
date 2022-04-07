if SislnkHL7ToIcsDb logs show that A34 messages are unable to get processed due to:

"1035: Unknown Mnemonic: A34"

Then change the STRAT file: EventStoreIcsDb_X.strat

first line:

ADT_HANDLER 			InbndEventProc.dll 		SpecialADTEventHandler

change SpecialADTEventHandler to ExtADTEventHandler

and restart the interface
