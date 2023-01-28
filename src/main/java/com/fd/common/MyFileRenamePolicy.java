package com.fd.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	public File rename(File originFile) {
		
		// 원본파일명
		String originName = originFile.getName();
		
		// 수정파일명
		// 1. 파일업로드시간
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		// 2. 5자리랜덤값
		int ranNum = (int)(Math.random() * 90000 + 10000);
		// 3. 원본파일확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		return new File(originFile.getParent(), changeName);
	}
	
}
