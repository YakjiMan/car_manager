package car_manager_dao;

import java.util.Map;
import java.io.*;

public class pythonbrowse {
	public String test(){
		String outBuffer = "";
		//중요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		//파이썬 가상 환경 경로 설정
			String RunPath = "C:\\Users\\MYCOM\\.conda\\envs\\project\\";
//			String RunPath = "C:\\ProgramData\\anaconda3\\";
		//파이썬 실행파일 설정
			String command = RunPath + "pythonw.exe";
			System.out.println(command);
		//파이썬 코드 파일 설정
			String pyname  = "E:\\SHS\\third_project\\SHS\\second_project\\car_manager\\WebContent\\python\\pororoOCR\\plate_db.py";
			System.out.println(pyname);
		// ==========================================================================================================
		try
		{
	        ProcessBuilder builder = new ProcessBuilder();
	        builder.command(command, pyname);
			Map<String, String> envs = builder.environment();
		    envs.put("Path", RunPath + "Scripts");
		    envs.put("Path", RunPath + "Library\\bin");
		    int exitVal = 0;
		    try {
		    	Process process = builder.start();
		    	exitVal = process.waitFor();  // 자식 프로세스가 종료될 때까지 기다림
		    	BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream(), "euc-kr"));
		    	String line;			
		    	// 서브 프로세스가 출력하는 내용을 받기 위해
		    	while ((line = br.readLine()) != null) 
		    	{
		    		System.out.println(line); // 표준출력에 쓴다
		    		outBuffer += line;
		    	}
		    }catch(Exception e)
		    {
		    	System.out.println(e);
		    }
			if(exitVal != 0) 
			{
				// 비정상 종료
				System.out.println("서브 프로세스가 비정상 종료되었다.");
			}
			System.out.print(outBuffer);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return outBuffer;
	}
}
