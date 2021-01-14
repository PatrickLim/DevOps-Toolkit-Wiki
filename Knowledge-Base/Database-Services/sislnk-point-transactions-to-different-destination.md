Script from Kyle Maasen:

update transactions set client_num = '1200', destination = '1300' where destination = '300' and transmitted is null and received < '1/14/21'