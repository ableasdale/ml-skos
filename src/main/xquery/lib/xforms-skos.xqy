xquery version "1.0-ml";

module namespace xforms-skos="http://www.xmlmachines.com/xforms-skos";

import module namespace xforms = "http://www.xmlmachines.com/xforms" at "/xquery/lib/xforms.xqy";

declare namespace skos="http://www.w3.org/2004/02/skos/core#";
declare namespace xf="http://www.w3.org/2002/xforms";
declare namespace ev="http://www.w3.org/2001/xml-events";
declare namespace xhtml="http://www.w3.org/1999/xhtml";
declare namespace xsltforms="http://www.agencexml.com/xsltforms";
declare namespace rte="http://www.agencexml.com/xsltforms/rte";

declare default function namespace "http://www.w3.org/2005/xpath-functions";
 
declare function xforms-skos:base-model() {
    <xf:model>
    
    <xs:schema targetNamespace="http://www.agencexml.com/xsltforms/rte">
        <xs:simpleType name="standardHTML">
            <xs:restriction base="xs:string" xsltforms:rte="TinyMCE"/>
            <xs:annotation>
                <xs:appinfo><![CDATA[
                    {
                        theme : "advanced",
                        skin : "o2k7",
                        plugins : "lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,inlinepopups,autosave",
                        theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
                        theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
                        /* theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
                        theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft", */
                        theme_advanced_toolbar_location : "top",
                        theme_advanced_toolbar_align : "left",
                        theme_advanced_statusbar_location : "bottom",
                        theme_advanced_resizing : true,
                    } ]]>
                </xs:appinfo>
            </xs:annotation>
        </xs:simpleType>
    </xs:schema>
     
    <!-- Nodeset bindings for TinyMCE editor -->
    <xf:bind nodeset="//skos:note" type="rte:standardHTML" />

        {if (string-length(xdmp:get-request-field("id")) gt 1)
        then (
        <xf:instance id="skos">
                { 
                    element skos:Concept {
                        for $x in doc(xdmp:get-request-field("id"))/skos:Concept/*
                        return 
                        if (fn:name($x) eq "skos:note")
                        then (xdmp:log("we got a skos note"), element skos:note {xdmp:quote($x)})
                        else ($x)
                        
                    }
                
                }
        </xf:instance>
        )
        else (<xf:instance id="skos" src="/xml/instance-data/skos-base.xml"/>)
        }
       
        <xf:instance id="submit-results">
            <data xmlns="" />
        </xf:instance>
   
        {if (string-length(xdmp:get-request-field("id")) gt 1)
        then (
         <xf:submission id="save" method="put" replace="instance" instance="submit-results" action="/save/{fn:substring-before(xdmp:get-request-field("id"), ".")}" ref="instance('skos')">
            <xf:toggle case="case-busy" ev:event="xforms-submit"></xf:toggle>
            <xf:load ev:event="xforms-submit-done" resource="/" show="replace" /> 
            <!-- XFSubmission.submit() -->
            <!-- <xf:toggle case="case-submit-done" ev:event="xforms-submit-done"></xf:toggle> -->
            <xf:toggle case="case-submit-error" ev:event="xforms-submit-error"></xf:toggle>
        </xf:submission>
        )
        else (
        <xf:submission id="save" method="put" replace="instance" instance="submit-results" action="/xquery/skos-concept-submit.xqy" ref="instance('skos')">
            <xf:toggle case="case-busy" ev:event="xforms-submit"></xf:toggle>
            <xf:load ev:event="xforms-submit-done" resource="/" show="replace" /> 
            <!-- XFSubmission.submit() -->
            <!-- <xf:toggle case="case-submit-done" ev:event="xforms-submit-done"></xf:toggle> -->
            <xf:toggle case="case-submit-error" ev:event="xforms-submit-error"></xf:toggle>
        </xf:submission>
        )
        }

    </xf:model>
};
