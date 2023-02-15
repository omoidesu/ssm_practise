package com.omoi.mapper;

import com.omoi.entity.Academy;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author xingj
 * @create 2023/2/15 10:20
 */
@Repository
public interface AcademyMapper {
    /**
     * 从数据库获取所有学院
     *
     * @return 学园列表
     */
    List<Academy> getAllAcademies();
}
