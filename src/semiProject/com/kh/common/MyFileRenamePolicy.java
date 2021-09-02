package semiProject.com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File originFile) { //업로드할 원본 파일이 전달됨
		String originName = originFile.getName();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH");
		String currentTime = sdf.format(new Date());
		
		int random =(int)(Math.random()*90000+10000);
		
		String ext ="";
		
		int dot = originName.lastIndexOf(".");
		ext = originName.substring(dot);
		
		String fileName = currentTime + random + ext;
		File renameFile = new File(originFile.getParent(), fileName);
		
		return renameFile;
	}

}
