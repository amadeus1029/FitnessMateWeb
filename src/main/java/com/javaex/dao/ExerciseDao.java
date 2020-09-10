package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.ExerciseVo;
import com.javaex.vo.RecordVo;
import com.javaex.vo.ScheduleVo;

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

	public List<ScheduleVo> selectExDate(int userNo) {
		return sqlSession.selectList("exercise.selectExDate", userNo);
	}

	public List<RecordVo> selectRecentEx(int userNo) {
		return sqlSession.selectList("exercise.selectRecentEx", userNo);
	}

	public List<RecordVo> selectRecentSet(int userNo) {
		return sqlSession.selectList("exercise.selectRecentSet", userNo);
	}

	public List<RecordVo> selectThisEx(int scheduleNo) {
		return sqlSession.selectList("exercise.selectThisEx", scheduleNo);
	}

	public List<RecordVo> selectThisSet(int scheduleNo) {
		return sqlSession.selectList("exercise.selectThisSet", scheduleNo);

	}
    
}
