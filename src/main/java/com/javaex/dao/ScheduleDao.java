package com.javaex.dao;

import com.javaex.vo.ScheduleVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ScheduleDao {

    @Autowired
    SqlSession sqlSession;

    public boolean insert(ScheduleVo scheduleVo) {
        return sqlSession.insert("schedule.insert", scheduleVo) == 1;
    }

    public List<ScheduleVo> getScheduleList(int trainerNo) {
        return sqlSession.selectList("schedule.selectList", trainerNo);
    }
}
