package com.foodregulation.serviceImpl.physical;

import com.foodregulation.dao.entity.EnterpriseUser;
import com.foodregulation.dao.entity.Physical;
import com.foodregulation.dao.mapper.EnterpriseUserMapper;
import com.foodregulation.dao.mapper.PhysicalMapper;
import com.foodregulation.service.physical.PhysicalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Description 从业人员体检
 * @Author yangchao
 * @Date 2016/12/18.
 */
@Service
public class PhysicalServiceImpl implements PhysicalService {

    @Autowired
    PhysicalMapper physicalMapper;
    @Autowired
    EnterpriseUserMapper enterpriseUserMapper;

    /**
     * 体检记录列表
     *
     * @param map
     * @return
     */
    @Override
    public List<Physical> selectPhysical(Map<String, Object> map) {
        return physicalMapper.selectPhysical(map);
    }

    /**
     * 体检记录数
     *
     * @return
     */
    @Override
    public long selectPhysicalTotal(Map<String,Object> map) {
        return physicalMapper.selectPhysicalTotal(map);
    }

    /**
     * 查找体检记录
     *
     * @param id
     * @return
     */
    @Override
    public Physical findPhysical(Long id) {
        return physicalMapper.selectByPrimaryKey(id);
    }

    /**
     * 新增体检记录
     *
     * @param physical
     * @return
     */
    @Override
    public int addPhysical(Physical physical) {
        return physicalMapper.insert(physical);
    }

    /**
     * 修改体检记录
     *
     * @param physical
     * @return
     */
    @Override
    public int updatePhysical(Physical physical) {
        return physicalMapper.updateByPrimaryKeySelective(physical);
    }

    /**
     * 删除体检记录
     *
     * @param id
     * @return
     */
    @Override
    public int delPhysical(Long id) {
    	//删除企业端用户登录信息
    	Physical physical = physicalMapper.selectByPrimaryKey(id);
    	physicalMapper.deleteEnUserByUserName(physical.getPhone());
        return physicalMapper.deleteByPrimaryKey(id);
    }

	@Override
	public EnterpriseUser selectEnterpriseUserByUsername(String userName) {
		return enterpriseUserMapper.selectEnterpriseUserByUsername(userName);
	}
	@Override
	public EnterpriseUser selectEnterpriseUserById(int id) {
		return enterpriseUserMapper.findEnterpriseUserById(id);
	}

	@Override
	public int addEnterpriseUser(EnterpriseUser enterpriseUser) {
		return enterpriseUserMapper.insert(enterpriseUser);
	}
}
