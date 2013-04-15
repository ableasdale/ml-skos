xquery version "1.0-ml"; 

import module namespace info = "http://marklogic.com/appservices/infostudio"  
      at "/MarkLogic/appservices/infostudio/info.xqy";

info:database-create("ML-SKOS", 2)
