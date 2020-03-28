package ws.handlers;

import java.io.IOException;
import java.util.Collections;
import java.util.Set;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.namespace.QName;
import javax.xml.soap.SOAPElement;
import javax.xml.soap.SOAPEnvelope;
import javax.xml.soap.SOAPException;
import javax.xml.soap.SOAPFactory;
import javax.xml.soap.SOAPHeader;
import javax.xml.soap.SOAPMessage;
import javax.xml.ws.handler.MessageContext;
import javax.xml.ws.handler.soap.SOAPHandler;
import javax.xml.ws.handler.soap.SOAPMessageContext;

public class TestMessageHandler implements SOAPHandler<SOAPMessageContext> {

    public boolean handleMessage(SOAPMessageContext messageContext) {
        SOAPMessage msg = messageContext.getMessage();
        Boolean outMessage = (Boolean) messageContext.get(MessageContext.MESSAGE_OUTBOUND_PROPERTY);

        if (outMessage) {
            try {
                SOAPEnvelope envelope = messageContext.getMessage().getSOAPPart().getEnvelope();
                SOAPFactory factory = SOAPFactory.newInstance();
                SOAPElement element = factory.createElement("UUID");
                element.addTextNode(UUID.randomUUID().toString());
                SOAPHeader header = envelope.getHeader();
                header.addChildElement(element);
                
            } catch (SOAPException ex) {
                Logger.getLogger(TestMessageHandler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        try {
            msg.writeTo(System.out);
        } catch (SOAPException ex) {
            Logger.getLogger(TestMessageHandler.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(TestMessageHandler.class.getName()).log(Level.SEVERE, null, ex);
        }

        return true;
    }

    public Set<QName> getHeaders() {
        return Collections.EMPTY_SET;
    }

    public boolean handleFault(SOAPMessageContext messageContext) {
        return true;
    }

    public void close(MessageContext context) {
    }
}
