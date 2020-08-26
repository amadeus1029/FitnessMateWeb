package com.javaex.dao;

import com.javaex.vo.ExerciseVo;
import com.javaex.vo.RecordVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ExerciseDao {

    @Autowired
    private SqlSession sqlSession;

    public List<ExerciseVo> showList() {
        return sqlSession.selectList("exercise.showList");
    }

    public List<ExerciseVo> getList(int trainerNo) {
        return sqlSession.selectList("exercise.getList", trainerNo);
    }

    public List<ExerciseVo> partList(int trainerNo) {
        return sqlSession.selectList("exercise.partList", trainerNo);
    }

    public ExerciseVo selectByNo(int exNo) {
        return sqlSession.selectOne("exercise.selectByNo", exNo);
    }

    public void insert(ExerciseVo exVo) {
        sqlSession.insert("exercise.insertSelectKey", exVo);
    }

    public Boolean delete(ExerciseVo exVo) {
        return sqlSession.delete("exercise.delete", exVo) == 1;
    }

    public List<ExerciseVo> showExPart(ExerciseVo exVo) {
        return sqlSession.selectList("exercise.selectByPart", exVo);
    }
}
