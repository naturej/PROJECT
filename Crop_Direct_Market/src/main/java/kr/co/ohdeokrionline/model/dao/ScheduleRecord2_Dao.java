package kr.co.ohdeokrionline.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.ohdeokrionline.model.vo.ScheduleRecord2_DTO;

public interface ScheduleRecord2_Dao {
	List<ScheduleRecord2_DTO> mySchedule(String user_id) throws SQLException;
	void scheduleAdd(ScheduleRecord2_DTO schedule) throws SQLException;
	void scheduleEdit(ScheduleRecord2_DTO schedule) throws SQLException;
	void scheduleRemove(ScheduleRecord2_DTO schedule) throws SQLException;
}
