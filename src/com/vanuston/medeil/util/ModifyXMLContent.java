package com.vanuston.medeil.util;

import java.io.File;
import static org.w3c.dom.Node.*;
import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.*;

public class ModifyXMLContent {
static Logger log = Logger.getLogger(ModifyXMLContent.class, "Utilities");
    static String nodeType(short type) {
        switch (type) {
            case ELEMENT_NODE:
                return "Element";
            case DOCUMENT_TYPE_NODE:
                return "Document type";
            case ENTITY_NODE:
                return "Entity";
            case ENTITY_REFERENCE_NODE:
                return "Entity reference";
            case NOTATION_NODE:
                return "Notation";
            case TEXT_NODE:
                return "Text";
            case COMMENT_NODE:
                return "Comment";
            case CDATA_SECTION_NODE:
                return "CDATA Section";
            case ATTRIBUTE_NODE:
                return "Attribute";
            case PROCESSING_INSTRUCTION_NODE:
                return "Attribute";
        }
        return "Unidentified";
    }

    static void listNodes(Node node, String indent, String[] h, String[] f) {
        short type = node.getNodeType();
        if (type == CDATA_SECTION_NODE) {
            int hLen = h.length;
            int fLen = f.length;
            if (hLen == fLen) {
                for (int i = 0; i < hLen; i++) {
                    String values = ((Text) node).getWholeText().replaceAll(h[i], f[i]);
                    node.setNodeValue(values);
                }
            }
        }
        NodeList list = node.getChildNodes();
        if (list.getLength() > 0) {
            for (int i = 0; i < list.getLength(); i++) {
                listNodes(list.item(i), indent + "  ", h, f);
            }
        }
    }

    public void modifyPageHW(File file, String pageH, String pageW) throws TransformerConfigurationException, TransformerException {

        try {
            DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
            builderFactory.setValidating(false);
            Document doc = builderFactory.newDocumentBuilder().parse(file);
            Element root = doc.getDocumentElement();
            root.getAttributeNode("pageHeight").getNodeValue();
            root.getAttributeNode("pageWidth").getNodeValue();
            root.getAttributeNode("pageHeight").setTextContent(pageH);
            root.getAttributeNode("pageWidth").setTextContent(pageW);
            updateXML(doc, file);
        } catch (Exception ex) {
        log.debug("Class : ModifyXMLContent Method : modifyPageHW Exception:"+ex.getMessage());
        }
    }

    public void modify(File file, String headers[], String fields[]) throws TransformerConfigurationException, TransformerException {

        try {
            DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
            builderFactory.setValidating(false);
            Document doc = builderFactory.newDocumentBuilder().parse(file);
            Element root = doc.getDocumentElement();
            Node node = root;
            short type = node.getNodeType();
            String indent = " ";
            String nodeName = node.getNodeName();
            NodeList list = node.getChildNodes();
            if (list.getLength() > 0) {
                for (int i = 0; i < list.getLength(); i++) {
                    listNodes(list.item(i), indent + "  ", headers, fields);
                }
            }
            updateXML(doc, file);
        } catch (Exception ex) {
            String msg = "Class : ModifyXMLContent Method  : modify  Exception:"+ex.getMessage();
            log.debug(msg);
        }
    }

    private static void updateXML(Document doc, File file) {
        Element root = doc.getDocumentElement();
        root.getAttributeNode(root.getNodeName());
        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = null;
        try {
            transformer = transformerFactory.newTransformer();
        } catch (TransformerConfigurationException ex) {
           String msg = "Class : ModifyXMLContent Method  : updateXML  Exception:"+ex.getMessage();
            log.debug(msg);
        }
        DOMSource source = new DOMSource(doc);
        StreamResult result = new StreamResult(file);
        try {
            transformer.transform(source, result);
        } catch (TransformerException ex) {
           String msg = "Method : updateXML  Exception:"+ex.getMessage();
            log.debug(msg);
        }
    }
}
