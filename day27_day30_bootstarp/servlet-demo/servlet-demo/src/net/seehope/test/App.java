package net.seehope.test;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;

import net.seehope.pojo.User;

public class App {

	public static void main(String[] args) throws IntrospectionException {
		BeanInfo beanInfo = Introspector.getBeanInfo(User.class, Object.class);
		PropertyDescriptor[] pds = beanInfo.getPropertyDescriptors();
		for (PropertyDescriptor pd:pds) {
			System.out.println("属性名：" + pd.getName());
			System.out.println(pd.getReadMethod().getName());
			System.out.println(pd.getWriteMethod().getName());
		}
	}
}
