package com.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DBcode extends DBconnect{
	public int insert(Employee employee)
	{
		int count=0;
		try
		{
			String q1 = "insert into  patient( patientname, patientmailid, patientmobile) values(?,?,?)";
			PreparedStatement pst = connection.prepareStatement(q1,Statement.RETURN_GENERATED_KEYS);
			pst.setString(1, employee.getName());
			pst.setString(2, employee.getMailid());
			pst.setLong(3, employee.getMobile());
			count = pst.executeUpdate();
			if(count==1) 
			{
				ResultSet rs = pst.getGeneratedKeys();
				rs.next();
				int autoid = rs.getInt(1);
				
				String q2 = "insert into official(offid,offstatus,offdate,offward ) values(?,?,?,?)";
				PreparedStatement pst2 = connection.prepareStatement(q2);
				pst2.setInt(1, autoid);
				pst2.setString(2,employee.getstatus());
				pst2.setString(3,employee.getDoj());
				pst2.setInt(4,employee.getId());
				count = pst2.executeUpdate();
			}
		}
		catch(Exception exception)
		{
			System.err.println(exception);
		}
		return count;
	}
	public int update(Employee employee)
	{
		int count=0;
		try
		{
			String q1 = "update patient set patientmailid=?,patientmobile=? where patientid=?";
			PreparedStatement pst = connection.prepareStatement(q1);
			pst.setString(1, employee.getMailid());
			pst.setLong(2, employee.getMobile());
			pst.setInt(3, employee.getId());
			count = pst.executeUpdate();
			if(count==1) //if update in personal table is success
			{
				String q2 = "update official set offward=? where offid=?";
				PreparedStatement pst2 = connection.prepareStatement(q2);
				pst2.setInt(2,employee.getId());
				pst2.setInt(1,employee.getward());
				count = pst2.executeUpdate();
			}
		}
		catch(Exception exception)
		{
			System.err.println(exception);
		}
		return count;
	}
	public int delete(int id)
	{
		int count=0;
		try
		{
			String q1 = "delete from patient where patientid = ?";
			PreparedStatement pst = connection.prepareStatement(q1);
			pst.setInt(1, id);
			count = pst.executeUpdate();
			if(count==1) //if delete  in personal table is success
			{
				String q2 = "delete from official where offid = ?";
				PreparedStatement pst2 = connection.prepareStatement(q2);
				pst2.setInt(1, id);
				count = pst2.executeUpdate();
			}
		}
		catch(Exception exception)
		{
			System.err.println(exception);
		}
		return count;
	}
	public ArrayList<Employee> selectall()
	{
		ArrayList<Employee> list = new ArrayList<Employee>();
		try
		{
			String q="select * from patient inner join official on patientid=offid";
			PreparedStatement pst = connection.prepareStatement(q);
			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{
				int id = rs.getInt("patientid");
				String name = rs.getString("patientname");
				String mailid = rs.getString("patientmailid");
				long mobile = rs.getLong("patientmobile");
				String status = rs.getString("offstatus");
				int ward = rs.getInt("offward");
				String date = rs.getString("offdate");
				Employee emp = new Employee(id, name, mailid, mobile, status, ward, date);
				list.add(emp);
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return list;
	}
	public Employee selectbyid(int id)
	{
		Employee emp = new Employee();
		try
		{
			String q="select * from patient inner join official on patientid=offid where patientid=?";
			PreparedStatement pst = connection.prepareStatement(q);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			rs.next();
			String name = rs.getString("patientname");
			String mailid = rs.getString("patientmailid");
			long mobile = rs.getLong("patientmobile");
			String status = rs.getString("offstatus");
			int salary = rs.getInt("offward");
			String doj = rs.getString("offdate");
			emp = new Employee(id, name, mailid, mobile, status, salary, doj);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return emp;
	}
}
