package utils;

public class BoardPage {
	
	// 페이지 이동 영역 출력
	public static String pagingStr(int totalPost, int currentPage, int blockSize, int pageSize, String url) {
		String pagingStr = "";
		
		int totalPage = (int)Math.ceil(totalPost / (double)pageSize);
		int currentBlock = (currentPage - 1) / blockSize + 1;
		int endPage = currentBlock * blockSize;
		if(endPage > totalPage) 
			endPage = totalPage;
		int startPage = (currentBlock - 1) * blockSize + 1;
		
		// 이전 페이지 블록 바로가기
		if(currentBlock != 1) {
			pagingStr = "<a href=\""+url+"\"?page=1>[첫 페이지]</a>&nbsp;"
				      + "<a href=\""+url+"?page="+(startPage - 1)+"\">[이전]</a>";
		}
		
		// 각 페이지 번호 출력
		for(int i = startPage; i <= endPage; i++) { 
			if(i == currentPage) 
				pagingStr += "&nbsp;" + i + "&nbsp;";
			else 
				pagingStr += "&nbsp;<a href=\""+url+"?page="+i+"\">"+i+"</a>&nbsp;";
		}
		
		// 다음 페이지 블록 바로가기
		if(endPage != totalPage) {
			pagingStr += "<a href=\""+url+"?page="+(endPage + 1)+"\">[다음]</a>&nbsp;"
					   + "<a href=\""+url+"?page="+ totalPage +"\">[마지막 페이지]</a>";
		}
		
		return pagingStr;
	}
}
