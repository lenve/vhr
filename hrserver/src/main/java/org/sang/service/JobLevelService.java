package org.sang.service;

import org.sang.bean.JobLevel;
import org.sang.mapper.JobLevelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by sang on 2018/1/11.
 */
@Service
@Transactional
public class JobLevelService {
    @Autowired
    JobLevelMapper jobLevelMapper;

    public int addJobLevel(JobLevel jobLevel) {
        if (jobLevelMapper.getJobLevelByName(jobLevel.getName()) != null) {
            return -1;
        }
        return jobLevelMapper.addJobLevel(jobLevel);
    }

    public List<JobLevel> getAllJobLevels() {
        return jobLevelMapper.getAllJobLevels();
    }

    public boolean deleteJobLevelById(String ids) {
        String[] split = ids.split(",");
        return jobLevelMapper.deleteJobLevelById(split) == split.length;
    }

    public int updateJobLevel(JobLevel jobLevel) {
        return jobLevelMapper.updateJobLevel(jobLevel);
    }
}
