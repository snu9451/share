package coolsms.app;

import java.util.Random;
import net.nurigo.java_sdk.exceptions.CoolsmsServerException;
import java.io.Reader;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.security.Key;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.util.Properties;
import net.nurigo.java_sdk.exceptions.CoolsmsSDKException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import java.util.Iterator;
import java.io.IOException;
import net.nurigo.java_sdk.exceptions.CoolsmsSystemException;
import org.json.simple.JSONArray;
import org.json.simple.JSONValue;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.DataOutputStream;
import java.io.BufferedOutputStream;
import java.net.URL;
import java.net.HttpURLConnection;
import java.util.Map;
import org.json.simple.JSONObject;
import java.util.HashMap;

public class Coolsms
{
    final String URL = "http://api.coolsms.co.kr";
    final String SDK_VERSION = "2.2";
    private String apiName;
    private String apiVersion;
    private String salt;
    private String timestamp;
    private String signature;
    private String apiKey;
    private String apiSecret;
    String charset;
    
    public Coolsms(final String apiKey, final String apiSecret) {
        this.apiName = "sms";
        this.apiVersion = "2";
        this.charset = "UTF-8";
        System.setProperty("jsse.enableSNIExtension", "false");
        this.apiKey = apiKey;
        this.apiSecret = apiSecret;
    }
    
    public JSONObject sendPostRequest(final String s, final HashMap<String, String> baseInfo) throws CoolsmsException {
        JSONObject jsonObject = new JSONObject();
        final HashMap<String, String> setBaseInfo = this.setBaseInfo(baseInfo);
        final String string = this.salt + this.timestamp;
        final String string2 = "\r\n--" + string + "\r\n";
        StringBuffer setPostData = new StringBuffer();
        setPostData.append(string2);
        for (final Map.Entry<String, String> entry : setBaseInfo.entrySet()) {
            final String s2 = entry.getKey();
            final String s3 = entry.getValue();
            if (s2 == "image") {
                continue;
            }
            setPostData = this.setPostData(setPostData, s2, s3, string2);
        }
        try {
            final HttpURLConnection httpURLConnection = (HttpURLConnection)new URL(this.getResourceUrl(s)).openConnection();
            httpURLConnection.setDoInput(true);
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setRequestMethod("POST");
            httpURLConnection.setRequestProperty("Connection", "Keep-Alive");
            httpURLConnection.setRequestProperty("Content-Type", "multipart/form-data;boundary=" + string);
            httpURLConnection.setUseCaches(false);
            final DataOutputStream dataOutputStream = new DataOutputStream(new BufferedOutputStream(httpURLConnection.getOutputStream()));
            if (setBaseInfo.get("image") != null) {
                setPostData.append(this.setFile("image", setBaseInfo.get("image")));
                setPostData.append("\r\n");
                final FileInputStream fileInputStream = new FileInputStream(setBaseInfo.get("image"));
                dataOutputStream.writeUTF(setPostData.toString());
                final int n = 1024;
                final int min = Math.min(fileInputStream.available(), n);
                final byte[] b = new byte[min];
                for (int i = fileInputStream.read(b, 0, min); i > 0; i = fileInputStream.read(b, 0, Math.min(fileInputStream.available(), n))) {
                    dataOutputStream.write(b);
                }
                fileInputStream.close();
            }
            else {
                dataOutputStream.writeUTF(setPostData.toString());
            }
            dataOutputStream.writeBytes(string2);
            dataOutputStream.flush();
            dataOutputStream.close();
            final String httpsResponse = this.getHttpsResponse(httpURLConnection);
            if (httpsResponse == null) {
                return jsonObject;
            }
            try {
                jsonObject = (JSONObject)JSONValue.parse(httpsResponse);
            }
            catch (ClassCastException ex3) {
                try {
                    jsonObject.put((Object)"data", (Object)JSONValue.parse(httpsResponse));
                }
                catch (Exception ex) {
                    throw new CoolsmsSystemException(ex.getMessage(), 302);
                }
            }
        }
        catch (IOException ex2) {
            throw new CoolsmsSystemException(ex2.getMessage(), 399);
        }
        return jsonObject;
    }
    
    public JSONObject sendGetRequest(final String s, final HashMap<String, String> baseInfo) throws CoolsmsException {
        JSONObject jsonObject = new JSONObject();
        final HashMap<String, String> setBaseInfo = this.setBaseInfo(baseInfo);
        final String string = this.getResourceUrl(s) + "?";
        String spec;
        try {
            spec = string + URLEncoder.encode("api_key", this.charset) + "=" + URLEncoder.encode(this.apiKey, this.charset);
        }
        catch (UnsupportedEncodingException ex) {
            throw new CoolsmsSystemException(ex.getMessage(), 399);
        }
        setBaseInfo.remove("api_secret");
        for (final Map.Entry<String, String> entry : setBaseInfo.entrySet()) {
            final String str = entry.getKey();
            final String str2 = entry.getValue();
            if (str == "api_key") {
                continue;
            }
            spec = this.setGetData(spec, str, str2);
            if (spec == null) {
                throw new CoolsmsSDKException("params is something wrong, key : " + str + " value : " + str2, 201);
            }
        }
        try {
            final HttpURLConnection httpURLConnection = (HttpURLConnection)new URL(spec).openConnection();
            httpURLConnection.setRequestMethod("GET");
            final String httpsResponse = this.getHttpsResponse(httpURLConnection);
            try {
                jsonObject = (JSONObject)JSONValue.parse(httpsResponse);
            }
            catch (ClassCastException ex4) {
                try {
                    jsonObject.put((Object)"data", (Object)JSONValue.parse(httpsResponse));
                }
                catch (Exception ex2) {
                    throw new CoolsmsSystemException(ex2.getMessage(), 302);
                }
            }
        }
        catch (IOException ex3) {
            throw new CoolsmsSystemException(ex3.getMessage(), 399);
        }
        return jsonObject;
    }
    
    public void setApiConfig(final String apiName, final String apiVersion) throws CoolsmsException {
        if (!this.checkString(apiName) || !this.checkString(apiVersion)) {
            throw new CoolsmsSDKException("API name and version is requried", 201);
        }
        this.apiName = apiName;
        this.apiVersion = apiVersion;
    }
    
    private HashMap<String, String> setBaseInfo(final HashMap<String, String> hashMap) throws CoolsmsException {
        final Properties properties = System.getProperties();
        this.salt = this.getSalt();
        this.timestamp = this.getTimestamp();
        this.signature = this.getSignature(this.apiSecret, this.salt, this.timestamp);
        hashMap.put("api_key", this.apiKey);
        hashMap.put("salt", this.salt);
        hashMap.put("signature", this.signature);
        hashMap.put("timestamp", this.timestamp);
        hashMap.put("os_platform", properties.getProperty("os.name"));
        hashMap.put("dev_lang", "JAVA " + properties.getProperty("java.version"));
        final String key = "sdk_version";
        final StringBuilder append = new StringBuilder().append("JAVA SDK ");
        this.getClass();
        hashMap.put(key, append.append("2.2").toString());
        return hashMap;
    }
    
    public String setFile(final String str, final String str2) {
        return "Content-Disposition: form-data; name=\"" + str + "\";filename=\"" + str2 + "\"\r\nContent-type: image/jpeg;\r\n";
    }
    
    public StringBuffer setPostData(final StringBuffer sb, final String str, final String str2, final String str3) throws CoolsmsException {
        try {
            sb.append("Content-Disposition: form-data; name=\"" + str + "\"\r\n\r\n" + str2);
            sb.append(str3);
        }
        catch (Exception ex) {
            throw new CoolsmsSystemException(ex.getMessage(), 302);
        }
        return sb;
    }
    
    public String setGetData(String string, final String s, final String s2) throws CoolsmsException {
        try {
            string = string + "&" + URLEncoder.encode(s, this.charset) + "=" + URLEncoder.encode(s2, this.charset);
        }
        catch (Exception ex) {
            throw new CoolsmsSystemException(ex.getMessage(), 302);
        }
        return string;
    }
    
    private String getResourceUrl(final String s) {
        final String format = "%s/%s/%s/%s";
        final Object[] args = new Object[4];
        final int n = 0;
        this.getClass();
        args[n] = "http://api.coolsms.co.kr";
        args[1] = this.apiName;
        args[2] = this.apiVersion;
        args[3] = s;
        return String.format(format, args);
    }
    
    public String getSignature(final String s, final String str, final String str2) throws CoolsmsException {
        String s2;
        try {
            final String string = str2 + str;
            final SecretKeySpec key = new SecretKeySpec(s.getBytes(), "HmacMD5");
            final Mac instance = Mac.getInstance("HmacMD5");
            instance.init(key);
            final byte[] doFinal = instance.doFinal(string.getBytes());
            final char[] charArray = "0123456789ABCDEF".toCharArray();
            final char[] value = new char[doFinal.length * 2];
            for (int i = 0; i < doFinal.length; ++i) {
                final int n = doFinal[i] & 0xFF;
                value[i * 2] = charArray[n >>> 4];
                value[i * 2 + 1] = charArray[n & 0xF];
            }
            s2 = new String(value);
        }
        catch (Exception ex) {
            throw new CoolsmsSystemException(ex.getMessage(), 302);
        }
        return s2;
    }
    
    public String getTimestamp() {
        return Long.toString(System.currentTimeMillis() / 1000L);
    }
    
    public String getHttpsResponse(final HttpURLConnection httpURLConnection) throws CoolsmsException {
        String s = null;
        final JSONObject jsonObject = new JSONObject();
        try {
            final int responseCode = httpURLConnection.getResponseCode();
            BufferedReader bufferedReader;
            if (responseCode != 200) {
                bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getErrorStream()));
            }
            else {
                bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
            }
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                s = line;
            }
            if (responseCode != 200) {
                throw new CoolsmsServerException(s, responseCode);
            }
        }
        catch (Exception ex) {
            throw new CoolsmsSystemException(ex.getMessage(), 302);
        }
        return s;
    }
    
    public String getSalt() {
        String string = "";
        final Random random = new Random();
        for (int i = 1; i <= 10; ++i) {
            string = string + random.nextInt(10) + "";
        }
        return string;
    }
    
    public boolean checkString(String trim) {
        if (trim == null) {
            return false;
        }
        trim = trim.trim();
        return trim != null && !trim.isEmpty();
    }
}