package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.javaex.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.SearchDao;

@Service
public class SearchService {

    @Autowired
    private SearchDao searchDao;

    //지역목록 불러오기
    public List<AddressVo> addProvince() {
        List<AddressVo> addVo = searchDao.provinceList();
        return addVo;
    }

    //구목록 불러오기
    public List<Object> addCity(String province) {
        List<Object> cityList = searchDao.cityList(province);
        return cityList;
    }

    //동목록 불러오기
    public List<Object> addRegion(String city) {
        List<Object> regionList = searchDao.regionList(city);
        return regionList;
    }

    //전문분야 불러오기
    public List<InterestFieldVo> addField() {
        List<InterestFieldVo> fieldVo = searchDao.fieldList();
        return fieldVo;
    }

    //트레이너 리스트 불러오기
    public Map<String, Object> getTrainerListMap(SearchVo searchVo) {

        // 지역 정보 담기
        String location = "";
        if (searchVo.getRegion() != null && !searchVo.getRegion().equals("")) {
            location = searchVo.getProvince() + "|" + searchVo.getCity() + "|" + searchVo.getRegion();
        } else if (searchVo.getCity() != null && !searchVo.getCity().equals("")) {
            location = searchVo.getProvince() + "|" + searchVo.getCity();
        } else {
            location = searchVo.getProvince();
        }
        searchVo.setLocation(location);

        int pageView = 8; //한 페이지에 표시할 게시물 수
        int pageNum = 5; //화면 하단에 표시할 페이지 최대 갯수
        int currPage = searchVo.getPage() > 0 ? searchVo.getPage() : 1;
        int totalPage = (searchDao.getTrainerCount(searchVo)-1)/pageView + 1;
        int _currPage = (currPage - 1)/pageNum;
        int beginPage = _currPage*pageNum+1;
        int endPage = Math.min(_currPage * pageNum + pageNum, totalPage);

        searchVo.setPage(currPage);
        searchVo.setPageView(pageView);




        List<UserVo> trainerList = searchDao.getTrainerList(searchVo);

        Map<String, Object> trainerListMap = new HashMap<String, Object>();

        trainerListMap.put("pageNum", pageNum);
        trainerListMap.put("currPage", currPage);
        trainerListMap.put("totalPage", totalPage);
        trainerListMap.put("beginPage", beginPage);
        trainerListMap.put("endPage", endPage);
        trainerListMap.put("trainerList", trainerList);

        return trainerListMap;
    }


    //////////////////////////////////////////////////////////

    //트레이너 세부정보 가져오기
    public UserVo trainerInfo(int no) {

        UserVo uVo = searchDao.readTrainer(no);

        return uVo;
    }


    public List<Object> fieldInfo(int no) {

        List<Object> uVo = searchDao.userField(no);

        return uVo;
    }

    public List<Object> recordInfo(int no) {
        List<Object> uVo = searchDao.userRecord(no);
        return uVo;
    }


    public List<Object> reviewInfo(int no) {
        List<Object> uVo = searchDao.reviewInfo(no);
        return uVo;
    }


    //////////////////////////////////////////////////////////

    //리뷰 목록 가져오기
    public List<ReviewVo> reviewList(int trainerNo, int page) {

        Map<String, Object> listMap = new HashMap<>();
        listMap.put("trainerNo", trainerNo);
        listMap.put("start", 1 + (page - 1) * 4);
        listMap.put("end", 1 + (page - 1) * 4 + (4 - 1));


        List<ReviewVo> reviewVo = searchDao.reviewList(listMap);
        return reviewVo;
    }

    // 페이지 정보
    public Map<String, Integer> reviewCount(int trainerNo) {
        Map<String, Integer> cMap = new HashMap<>();
        cMap.put("countAll", searchDao.reviewCount(trainerNo));
        cMap.put("count", (int) Math.ceil(cMap.get("countAll") / 4.0));

        return cMap;
    }


    // 리뷰작성자격 확인
    public ReviewVo reviewWrite(int no) {
        System.out.println("SearchService:reviewWrite");
        ReviewVo reviewVo = searchDao.reviewWrite(no);
        return reviewVo;
    }


    //리뷰 추가
    public ReviewVo reviewPlus(int score, String content, int ptNo) {
        System.out.println("SearchService:reviewPlus");

        ReviewVo reviewVo = new ReviewVo(score, content, ptNo);
        System.out.println("서비스 보 확인" + reviewVo);

        searchDao.reviewPlus(reviewVo);

        int reviewNo = reviewVo.getReviewNo();

        ReviewVo vo = searchDao.reviewOne(reviewNo);

        return vo;
    }

    //답글추가
    public ReviewVo rereviewPlus(int score, String content, int ptNo, int group_no) {
        System.out.println("SearchService:rereviewPlus");

        ReviewVo reviewVo = new ReviewVo(score, content, ptNo, group_no);
        System.out.println("서비스 보 확인" + reviewVo);

        searchDao.rereviewPlus(reviewVo);

        int reviewNo = reviewVo.getReviewNo();
        System.out.println("리뷰넘버 추출 확인" + reviewNo);

        ReviewVo vo = searchDao.reviewOne(reviewNo);

        return vo;
    }

    // 리뷰수정
    public List<ReviewVo> reviewModify(int score, String content, int reviewNo, int page) {
        System.out.println("SearchService:reviewPlus");

        Map<String, Object> remap = new HashMap<>();
        remap.put("score", score);
        remap.put("content", content);
        remap.put("reviewNo", reviewNo);

        searchDao.reviewModify(remap);
        System.out.println("수정내용 확인" + remap);

        ReviewVo vo = searchDao.reviewOne(reviewNo);

        int tNo = vo.getTrainerNo();

        System.out.println("트레이너 넘버확인" + tNo);
        Map<String, Object> listMap = new HashMap<>();
        listMap.put("trainerNo", tNo);
        listMap.put("start", 1 + (page - 1) * 4);
        listMap.put("end", 1 + (page - 1) * 4 + (4 - 1));

        List<ReviewVo> reviewVo = searchDao.reviewList(listMap);


        return reviewVo;
    }

    //리뷰 추가위해 pt넘버 불러오기
    public int findPt(int userNo) {
        System.out.println("SearchService:findPt");

        int ptNo = searchDao.findPt(userNo);

        return ptNo;
    }

    //리뷰삭제
    public int reviewRemove(int reviewNo) {
        System.out.println("SearchService:reviewRemove");

        int remove = searchDao.reviewRemove(reviewNo);

        return remove;
    }


}
