xquery version "1.0-ml"; 

import module namespace search = "http://marklogic.com/appservices/search"
     at "/MarkLogic/appservices/search/search.xqy";

search:search("Fantasy fiction",
<options xmlns="http://marklogic.com/appservices/search">
  <!-- constraint name="sample-property-constraint">
    <properties />
  </constraint -->
  <debug>true</debug>
</options>)