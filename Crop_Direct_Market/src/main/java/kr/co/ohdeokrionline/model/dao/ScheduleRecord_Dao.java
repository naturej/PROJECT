package kr.co.ohdeokrionline.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.ohdeokrionline.model.vo.ScheduleRecord_DTO;

public interface ScheduleRecord_Dao {
	List<ScheduleRecord_DTO> mySchedule(String user_id) throws SQLException;
	void scheduleAdd(ScheduleRecord_DTO schedule) throws SQLException;
}
