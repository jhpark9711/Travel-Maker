package com.kosmo.travelmaker.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.travelmaker.service.PlannerService;

@Service("plannerService")
public class PlannerServiceImpl implements PlannerService{
	@Resource(name="plannerDAO")
	PlannerDAO plannerDAO;
	
	@Override
	public String AllPlan() {
		
		return null;
	}


	@Override
	public boolean insertPlanner(String id) {
		// TODO Auto-generated method stub
		return plannerDAO.insertPlanner(id);
	}

	@Override
	public boolean insertCities(int city_no) {
		return plannerDAO.insertCities(city_no);
	}
	
}
