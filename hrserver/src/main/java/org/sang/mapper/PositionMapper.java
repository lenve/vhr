package org.sang.mapper;

import org.apache.ibatis.annotations.Param;
import org.sang.bean.Position;

import java.util.List;

/**
 * Created by sang on 2018/1/10.
 */
public interface PositionMapper {

    int addPos(@Param("pos") Position pos);

    Position getPosByName(String name);

    List<Position> getAllPos();

    int deletePosById(@Param("pids") String[] pids);

    int updatePosById(@Param("pos") Position position);
}
