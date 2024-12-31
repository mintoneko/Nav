package nav;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;

public class ImgValidationTest {
    public static void main(String[] args) {
        String imageUrl = "https://himg.bdimg.com/sys/portrait/item/pp.1.5eae9c09._--DAyZLHp4dlX8yWmoCAA?_t=1735634378737";
        boolean isValid = isValidImage(imageUrl);
        System.out.println("Image URL is valid: " + isValid);
    }
    public static boolean isValidImage(String imageUrl) {
        try {
            HttpClient httpClient = HttpClientBuilder.create().build();
            HttpResponse response = httpClient.execute(new HttpGet(imageUrl));
            int statusCode = response.getStatusLine().getStatusCode();
            return statusCode == 200;
        } catch (Exception e) {
            return false;
        }
    }
}
