/**
 * 
 */
package egovframework.example.image.service;

/**
 * @author user
 *	디폴트 이미지로 처리해주는 패키지입니다 (테스트)
 */
public interface BookImageService {
	byte[] getImageOrDefault(byte[] image);
}
