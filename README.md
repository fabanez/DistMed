# DistMed
Test Project
Proyecto de prueba
Este proyecto esta hecho en VS2019 con NET Core 3.1

Las capturas se hicieron de 3 diferentes maneras para tener acceso a datos, que se detallan a continuación:
* Articulos: El acceso a datos fué através de entity framework y modelos de datos solamente
* Bodegas: Acceso a datos através de entity framework, pero haciendo uso de stored procedures tanto para traer datos a los modelos como para hacer modificaciones en la base de datos
* Inventarios: Para el caso de este registro se desarrollo una capa de acceso a datos, respetando el principio de inyección de dependencias, se crearon una interfase y una clase para el acceso a la base de datos (esto en caso de que el repositorio de datos cambie, solo hay que hacer una clase que implemente la interfaz)
