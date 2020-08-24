package com.javaex.dao;

import com.javaex.vo.ExerciseVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ExerciseDao {

    @Autowired
    private SqlSession sqlSession;

    public List<ExerciseVo> getList(int trainerNo) {
        return sqlSession.selectList("exercise", trainerNo);
    }
}
