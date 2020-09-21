package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.SearchService;
import com.javaex.vo.ReviewVo;
import com.javaex.vo.UserVo;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService searchService;
	
	//검색 /////////////////////////////////////////////////////////////////////////
	//검색하기
	@ResponseBody
	@RequestMapping("/search/results")
	public List<UserVo> results(@RequestParam(value="province",required=false) String province,
						  @RequestParam(value="city",required=false) String city,
						  @RequestParam(value="region",required=false) String region,
						  @RequestParam(value="gender",required=false) String gender,
						  @RequestParam(value="field",required=false) String field,
						  @RequestParam(value="name",required=false) String name
						  ) 
	{   System.out.println("controller"+province+city+region+gender+field+name);
		List<UserVo> userVo  = searchService.userList(province,city,region,gender,field,name);
		System.out.println("controller:search/results");
				
		return userVo;
	}
	
	
	//주소(구) 가져오기
	@ResponseBody
	@RequestMapping("/search/getCity")
	public List<Object> getCity(@RequestParam("province") String province) {
		System.out.println("controller:search/getCity");
		List<Object> pro = searchService.addCity(province);

		return pro;
	}

	//주소(동) 가져오기
	@ResponseBody
	@RequestMapping("/search/getRegion")
	public List<Object> getRegion(@RequestParam("city") String city) {
		System.out.println("controller:search/getRegion");
		List<Object> reg = searchService.addRegion(city);

		return reg;
	}
	
	//트레이너 정보 불러오기/////////////////////////////////////////////////////////////////////////
	
	// 트레이너 세부정보 불러오기
	@ResponseBody
	@RequestMapping("/search/trainerInfo")
	public UserVo trainerInfo(@RequestParam("no") int no) {
		System.out.println("controller:/search/trainerInfo");

		UserVo uVo = searchService.trainerInfo(no);

		return uVo;

	}

	// 트레이너 세부정보 불러오기(전문분야)
	@ResponseBody
	@RequestMapping("/search/fieldInfo")
	public List<Object> fieldInfo(@RequestParam("no") int no) {
		System.out.println("controller:/search/trainerInfo");

		List<Object> uVo = searchService.fieldInfo(no);
		return uVo;

	}

	// 트레이너 세부정보 불러오기(수상경력)
	@ResponseBody
	@RequestMapping("/search/recordInfo")
	public List<Object> recordInfo(@RequestParam("no") int no) {
		System.out.println("controller:/search/recordInfo");

		List<Object> uVo = searchService.recordInfo(no);
		return uVo;

	}
	
	
	//트레이너 세부정보 불러오기(리뷰)
	@ResponseBody
	@RequestMapping("/search/reviewInfo")
	public List<Object> reviewInfo(@RequestParam("no") int no) {
		System.out.println("컨:리뷰정보 불러오기");

		List<Object> uVo = searchService.reviewInfo(no);
		
		System.out.println("리뷰정보"+uVo);
		
		return uVo;

	}
	
	
	//리뷰정보 불러오기/////////////////////////////////////////////////////////////////////////
	// 리뷰목록 불러오기
	@ResponseBody
	@RequestMapping("/search/reviewList")
	public List<ReviewVo> reviewList(@RequestParam("no") int no) {
		System.out.println("controller:/search/reviewList");

		System.out.println("넘버"+no);
		List<ReviewVo> reviewVo = searchService.reviewList(no);

		
		return reviewVo;

	}
	
	// 리뷰작성 가능한 사람인지 확인
	@ResponseBody
	@RequestMapping("/search/reviewWrite")
	public ReviewVo reviewWrite(@RequestParam("no") int no) {
		System.out.println("controller:/search/reviewWrite");

		System.out.println("리뷰넘버"+no);
		ReviewVo reviewVo = searchService.reviewWrite(no);
		
		System.out.println("리뷰작성자격 확인"+reviewVo);
		
		return reviewVo;

	}
	
	// 리뷰 추가위해 pt넘버 불러오기
	@ResponseBody
	@RequestMapping("/search/findPt")
	public int findPt(@RequestParam("userNo") int userNo) {
		System.out.println("controller:/search/findPt");
		int ptNo = searchService.findPt(userNo);

		System.out.println("컨트롤러 pt" + ptNo);

		return ptNo;
	}

	// 리뷰추가
	@ResponseBody
	@RequestMapping("/search/reviewPlus")
	public ReviewVo reviewPlus(@RequestParam("score") int score, @RequestParam("content") String content,
			@RequestParam("ptNo") int ptNo) {
		System.out.println("controller:/search/reviewPlus");
		System.out.println("파람확인" + score + content);
		ReviewVo reviewVo = searchService.reviewPlus(score, content, ptNo);		

		return reviewVo;
	}
	
	// 답글추가
		@ResponseBody
		@RequestMapping("/search/rereviewPlus")
		public ReviewVo rereviewPlus(@RequestParam("score") int score, @RequestParam("content") String content,
				@RequestParam("ptNo") int ptNo,@RequestParam("group_no") int group_no) {
			System.out.println("controller:/search/reviewPlus");
			System.out.println("파람확인" + score + content);
			ReviewVo reviewVo = searchService.rereviewPlus(score, content, ptNo,group_no);		

			return reviewVo;
		}
	
	
	
	
	// 리뷰수정
	@ResponseBody
	@RequestMapping("/search/reviewModify")
	public List<ReviewVo> reviewModify(@RequestParam("score") int score, @RequestParam("content") String content,
			@RequestParam("reviewNo") int reviewNo) {
		System.out.println("controller:/search/reviewModify");
		System.out.println("파람확인" + score + content);
		List<ReviewVo> reviewVo = searchService.reviewModify(score, content,reviewNo);

		System.out.println("리뷰수정정보 제대로 가지고 와지나 확인" + reviewVo);

		return reviewVo;
	}
	
	//리뷰 삭제
	@ResponseBody
	@RequestMapping("/search/reviewRemove")
	public int reviewRemove(@RequestParam("reviewNo") int reviewNo) {
		System.out.println("controller:/search/reviewRemove");
		System.out.println("리뷰넘버 확인"+reviewNo );
		int remove = searchService.reviewRemove(reviewNo);

		return remove;
	}
	
	
	
}
