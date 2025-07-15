/**
 * 
 */
package egovframework.example.image.service.impl;

import java.io.IOException;
import java.io.InputStream;

import org.springframework.stereotype.Service;

import egovframework.example.image.service.BookImageService;

/**
 * @author user
 *
 */
@Service
public class BookImageServiceImpl implements BookImageService {

	 private byte[] defaultImage;
	 
	 public BookImageServiceImpl() {
	        loadDefaultImage();
	    }
	 
	 private void loadDefaultImage() {
	        try (InputStream is = getClass().getResourceAsStream("/images/default_book.jpg")) {
	            if (is != null) {
	                defaultImage = is.readAllBytes();
	                System.out.println("기본 이미지 로드 성공!");
	            } else {
	                System.out.println("기본 이미지 파일을 찾을 수 없습니다!");
	                defaultImage = new byte[0];
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	            defaultImage = new byte[0];
	        }
	    }
	 @Override 
	public byte[] getImageOrDefault(byte[] image) {
		// TODO Auto-generated method stub
		if (image == null || image.length == 0) {
            return defaultImage;
        }
		return image;
	}
	
	
	

}
