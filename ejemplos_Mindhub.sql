-- Traigo a todos los clientes y cuentas con todas sus propiedades.
SELECT * FROM client INNER JOIN account on client.id = account.client;

--Traigo la suma de balances, cuantas cuentas hay y el balance minimo de las cuentas.
SELECT SUM(balance), count(id), min(balance) from account;

--Ordeno los balances de forma descendiente
SELECT * FROM account ORDER BY balance DESC;