package com.foodregulation.serviceImpl.dictionary;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodregulation.dao.entity.Dictionary;
import com.foodregulation.dao.mapper.DictionaryMapper;
import com.foodregulation.service.Dictionary.DictionaryService;

@Service
public class DictionaryServiceImpl implements DictionaryService {

    @Autowired
    DictionaryMapper dictionaryMapper;


    @Override
    public List<Dictionary> getDictionaryByType(Integer type) {
        return dictionaryMapper.getDictionaryByType(type);
    }


    @Override
    public Dictionary getDictionaryByCode(String tDictionaryCode) {
        return dictionaryMapper.getDictionaryByCode(tDictionaryCode);
    }


    @Override
    public List<Dictionary> getDictionaryList(Integer pageIndex, Integer pageSize, Integer type) {
        return dictionaryMapper.getDictionaryList(pageIndex, pageSize, type);
    }


    @Override
    public Long getDictionaryListCount(Integer type) {
        return dictionaryMapper.getDictionaryListCount(type);
    }


    @Override
    public Integer deleteDictionary(Integer id) {
        return dictionaryMapper.deleteByPrimaryKey(id);
    }


    @Override
    public Integer updateDictionary(Dictionary dictionary) {
        return dictionaryMapper.updateByPrimaryKeySelective(dictionary);
    }


    @Override
    public Integer saveDictionary(Dictionary dictionary) {
        // 获取该类型的最大的一个值
        List<Dictionary> list = dictionaryMapper.getDictionaryList(0, 1, dictionary.gettDictionaryType());
        String str = "";
        if (list == null || list.size() < 1) {
            Integer type = dictionary.gettDictionaryType();
            if (type == 0) {
                str = "address_0";
            } else if (type == 1) {
                str = "enterprise_0";
            } else if (type == 2) {
                str = "unit_0";
            } else if (type == 5) {
                str = "economic_0";
            } else if (type == 6) {
                str = "check_0";
            } else if (type == 7) {
                str = "sampling_0";
            }
        } else {
            str = list.get(0).gettDictionaryCode();
        }

        String[] strs = str.split("_");
        dictionary.settDictionaryCode(strs[0] + "_" + (Integer.valueOf(strs[1]) + 1));
        return dictionaryMapper.insert(dictionary);
    }


	@Override
	public Dictionary selectByPrimaryKey(Integer id) {
		return dictionaryMapper.selectByPrimaryKey(id);
	}


	@Override
	public int selectEnterpriseTypeIdByEnterpriseUserId(Integer personId) {
		Map<String,Object> map = dictionaryMapper.selectEnterpriseTypeIdByEnterpriseUserId(personId);
		if(map!=null){
			return map.get("id")==null?-1:Integer.valueOf(map.get("id").toString());
		}
		return -1;
	}
}
