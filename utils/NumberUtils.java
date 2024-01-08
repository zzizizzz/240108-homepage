package utils;

public class NumberUtils {
	/**
	 * 텍스트와 기본값을 전달받아서 텍스트를 정수로 변환해서 반환한다.
	 * @param text 숫자로 구성된 텍스트
	 * @param defaultValue 기본값
	 * @return 정수값, 문자열이 null이거나 비어있거나 숫자로만 구성되어 있지 않으면 기본값을 반환한다.
	 */

	public static int toInt(String text, int defaultValue) {
		if(text==null) {
			return defaultValue; 
		}
		if(text.isBlank()) {
			return defaultValue;
		}
		try {
			return Integer.valueOf(text);
			
		}catch (NumberFormatException e) {
			return defaultValue;
		}
	}
		
	/**
	 * 테스트 전달받아서 정수로 변환된 값을 반환한다.
	 * @param text 숫자로 구성된 문자열
	 * @return 정수값, 문자열이 null이거나 비어있거나 숫자로만 구성되어 있지 않으면 0을 반환한다.
	 */
	public static int toInt(String text) {
		return toInt(text, 0);

	}
}
