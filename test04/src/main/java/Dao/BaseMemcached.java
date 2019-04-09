package Dao;

import net.spy.memcached.MemcachedClient;

import java.io.IOException;
import java.net.InetSocketAddress;

public class BaseMemcached {

    /**
     * 获取连接
     */
    public MemcachedClient getConnect(){
        MemcachedClient mcc = null;
        try {
            mcc = new MemcachedClient(new InetSocketAddress("127.0.0.1",11211));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return mcc;
    }

}
