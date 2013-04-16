xquery version "1.0-ml";

module namespace xforms="http://www.xmlmachines.com/xforms";

declare namespace xf="http://www.w3.org/2002/xforms";
declare namespace ev="http://www.w3.org/2001/xml-events";
declare namespace xhtml="http://www.w3.org/1999/xhtml";

import module namespace global = "http://www.xmlmachines.com/global" at "/xquery/lib/global.xqy";

declare default function namespace "http://www.w3.org/2005/xpath-functions";

declare function xforms:xsltforms-pis() as processing-instruction()+ {
<?xml-stylesheet href="/xsltforms/xsltforms.xsl" type="text/xsl"?>,
if($global:DEBUG eq "yes")
then(<?xsltforms-options debug="yes"?>)
else(<?xsltforms-options debug="no"?>)
(: processing-instruction {"xml-stylesheet"} {attribute href{"xsltforms/xsltforms.xsl"}, attribute type{"text/xsl"} } :)
};

declare function xforms:capitalise($string as xs:string){
    concat(upper-case(substring($string,1,1)), substring($string,2))
};

declare function xforms:xhtml-fieldset-and-legend($legend as xs:string, $seq as item()*) as element(xhtml:fieldset) {
    element xhtml:fieldset{
        element xhtml:legend {$legend},
        $seq
    }
};

declare function xforms:xf-label($label-class as xs:string?, $label-text as xs:string)  as element(xf:label) {
    element xf:label {
        if(string-length($label-class) ne 0) then(attribute class {$label-class}) else(),
        $label-text
    }
};

declare function xforms:xf-input($input-id as xs:string?, $input-ref as xs:string, $label-class as xs:string?, $label-text as xs:string) as element(xf:input) {
    element xf:input {
        if(string-length($input-id) ne 0) then(attribute id {$input-id}) else(), 
        attribute ref {$input-ref},
        element xf:label {attribute class {$label-class}, $label-text}
    }
};

declare function xforms:xf-input-checkbox($input-ref as xs:string, $label-class as xs:string?, $label-text as xs:string) as element(xf:input) {
    element xf:input {attribute class {"checkbox"}, 
        attribute ref {$input-ref},
        xforms:xf-label($label-class, $label-text) 
    }
};
 
declare function xforms:para-with-xf-range($ref as xs:string, $start as xs:integer, $end as xs:integer, $step as xs:integer, $incremental as xs:boolean, $label-class as xs:string?, $label-text as xs:string) as element(xhtml:p) {
    element xhtml:p {
        element xf:range {
            attribute ref {$ref}, attribute start {$start}, attribute end {$end}, attribute step {$step}, 
            if ($incremental) then (attribute incremental {"true"}) else (),
            xforms:xf-label($label-class, $label-text) 
        }
    }
};
 
declare function xforms:para-with-xf-input($input-id as xs:string?, $input-ref as xs:string, $label-class as xs:string?, $label-text as xs:string) as element(xhtml:p) {
    element xhtml:p {
        xforms:xf-input($input-id, $input-ref, $label-class, $label-text)    
    }
};

declare function xforms:para-with-xf-input-checkbox($input-ref as xs:string, $label-class as xs:string?, $label-text as xs:string) as element(xhtml:p) {
    element xhtml:p {
        xforms:xf-input-checkbox($input-ref, $label-class, $label-text)    
    }
}; 

declare function xforms:para-with-select1($input-id as xs:string?, $input-ref as xs:string, $label-class as xs:string?, $label-text as xs:string, $itemset-model, $itemset-nodeset) as element(xhtml:p) {
    element xhtml:p {
        element xf:select1 {
            if(string-length($input-id) ne 0) then(attribute id {$input-id}) else(),
            attribute ref {$input-ref},
            xforms:xf-label($label-class, $label-text),
            element xf:itemset {
                attribute model {$itemset-model},
                attribute nodeset {$itemset-nodeset},
                element xf:label {attribute ref {"Label"}},
                element xf:value {attribute ref {"Value"}}
            }
            
        }
    } 
};

declare function xforms:html-textarea($ref as xs:string) as element(xf:group) {
    element xf:group {attribute xmlns {"http://www.w3.org/2002/xforms"},
        element xf:textarea {
            attribute ref {$ref}, 
            attribute class {"large-textarea"}, 
            attribute mediatype {"application/xhtml+xml"}
        }
    } 
};

(: Creates an xf:trigger which is an image   :) 
declare function xforms:image-trigger($class as xs:string?, $src as xs:string, $text as xs:string?, $event-id as xs:string) as element(xf:trigger){
    element xf:trigger {attribute class {$class}, attribute appearance {"minimal"},
        element xf:label {
            element xhtml:img {attribute src {$src}, attribute title {$text}, attribute alt {$text}}, 
            $text},
        element xf:toggle {attribute ev:event {"DOMActivate"}, attribute case {$event-id}}
    }
};
