package ws.proxy;

import java.io.IOException;
import java.net.*;
import java.util.ArrayList;
import java.util.List;

public class CustomProxySelector extends ProxySelector {

    @Override
    public List select(URI uri) {
        ArrayList list = new ArrayList();
        if (uri.getScheme().toUpperCase().equals("HTTP")) {
            Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress("localhost", 8088));
            
            list.add(proxy);
        }
        return list;
    }

    @Override
    public void connectFailed(URI uri, SocketAddress sa, IOException ioe) {
        System.err.println("Connection to " + uri + " failed.");
    }
}