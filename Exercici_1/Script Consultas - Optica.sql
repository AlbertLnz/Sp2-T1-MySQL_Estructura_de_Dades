SELECT id_client, nom_empresa, marca AS ulleres_comprades FROM clients LEFT JOIN ulleres ON clients.id_client = ulleres.client_id;
SELECT nom AS nom_treballador, marca AS marca_venuda, data_compra FROM treballadors LEFT JOIN ulleres ON treballadors.id_treballador = ulleres.treballador_id WHERE ulleres.data_compra BETWEEN "2019-01-01" AND "2019-12-31";
SELECT proveidor.nom AS nom_proveidor, ulleres.marca AS ullera_venuda FROM proveidor LEFT JOIN ulleres ON proveidor.id_proveidor = ulleres.proveidor_id WHERE ulleres.clients_id IS NOT NULL
