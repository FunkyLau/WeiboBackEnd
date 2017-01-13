package com.action;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.multipart.MultiPartRequest;
import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.domain.Messages;
import com.domain.ObjectResult;
import com.domain.Pictures;
import com.domain.Users;
import com.service.PicturesService;
import com.utils.ComboBoxBean;
import com.utils.OperateImage;
import com.utils.Pagination;
public class PicturesAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	//private static final String ServerURL = "http://le1ul1u.com/";
	private static final String ServerURL = "http://10.1.1.123/";
	private Pictures pictures;
	private Messages messages;
	private Users users;
	private PicturesService picturesService;

	private File upload; // 上传的文件
	private String uploadContentType;// 文件类型
	private String uploadFileName;// 文件的名称
	private String finalPath;
	private String delPicURL;

	private String cutImgX;
	private String cutImgY;
	private String cutImgW;
	private String cutImgH;
	private String cutImgPath;
	public String getCutImgX() {
		return cutImgX;
	}

	public void setCutImgX(String cutImgX) {
		this.cutImgX = cutImgX;
	}

	public String getCutImgY() {
		return cutImgY;
	}

	public void setCutImgY(String cutImgY) {
		this.cutImgY = cutImgY;
	}

	public String getCutImgW() {
		return cutImgW;
	}

	public void setCutImgW(String cutImgW) {
		this.cutImgW = cutImgW;
	}

	public String getCutImgH() {
		return cutImgH;
	}

	public void setCutImgH(String cutImgH) {
		this.cutImgH = cutImgH;
	}

	public String getCutImgPath() {
		return cutImgPath;
	}

	public void setCutImgPath(String cutImgPath) {
		this.cutImgPath = cutImgPath;
	}

	public String getDelPicURL() {
		return delPicURL;
	}

	public void setDelPicURL(String delPicURL) {
		this.delPicURL = delPicURL;
	}

	public String getFinalPath() {
		return finalPath;
	}

	public File getUpload() {
		return upload;
	}

	public void setFinalPath(String finalPath) {
		this.finalPath = finalPath;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setPicturesService(PicturesService picturesService) {
		this.picturesService = picturesService;
	}

	public void setPictures(Pictures pictures) {
		this.pictures = pictures;
	}

	public Messages getMessages() {
		return messages;
	}

	public void setMessages(Messages messages) {
		this.messages = messages;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Pictures getPictures() {
		return pictures;
	}

	public String query() {
		pagination = new Pagination(this.page, this.rows);
		String whereSql = spliceSql();
		pagination.setTotal(baseService.getCount(Pictures.class, whereSql));
		pagination.setRows(baseService.getObjects(Pictures.class, whereSql,
				pagination.getFrom(), pagination.getSize(), this.order,
				this.sort));
		return "query";
	}
	
	private String spliceSql() {
		String whereSql = " as tt where 1=1";
		if (pictures != null) {
			if (pictures.getMessages() != null) {
				Integer mid = pictures.getMessages().getMessagesId();

				if (!"".equals(mid) && (mid != null)) {
					whereSql += " and tt.messages.messagesId = '" + mid + "'";
				}
			}

			if (pictures.getUsers() != null) {
				String uEmail = pictures.getUsers().getUsersEmail();
				if (!"".equals(uEmail) && (uEmail != null)) {
					whereSql += " and tt.users.usersEmail like '%" + uEmail + "%'";
				}
			}

			if (pictures.getPicturesType() != null) {
				String pType = pictures.getPicturesType();
				if (!"".equals(pType) && (pType != null)) {
					whereSql += " and tt.picturesType = '" + pType + "'";
				}
			}
		}
		return whereSql;
	}
	
	public String getAllUsers() {
		List<Users> users = baseService.getAllObjects(Users.class);
		for (Users user : users) {
			list.add(new ComboBoxBean(user.getUsersId(), user.getUsersEmail(), false));
		}
		return "queryall";
	}

	public String getAllMessages() {
		List<Messages> messages = baseService.getAllObjects(Messages.class);
		for (Messages message : messages) {
			list.add(new ComboBoxBean(message.getMessagesId(), message.getMessagesId().toString(), false));
		}
		return "queryall";
	}
	
	public String getAllPictures() {
		List<Pictures> pictures = baseService.getAllObjects(Pictures.class);
		ComboBoxBean comboBoxBean = null;
		for (Pictures picture : pictures) {
			comboBoxBean = new ComboBoxBean(null, picture.getPicturesType(), false);
			if (list.size() == 0) {
				list.add(comboBoxBean);
			} else {
				boolean pic_flag = false;
				for (ComboBoxBean bean : list) {
					if ((bean.getText().equals(comboBoxBean.getText()))) {
						pic_flag = true;
						break;
					}
				}
				if (!pic_flag) {
					list.add(comboBoxBean);
				}
			}
		}
		return "queryall";
	}
	
	public String saveOrUpdateObject() {
		this.flag = baseService.saveOrUpdateObject(pictures);
		return "saveorupdate";
	}
	
	public String deleteObject() {
		System.out.println(ids);
		String whereSql = "where usersId in (" + ids + ")";
		List<Pictures> pictures = baseService.getObjects(Pictures.class,whereSql);
		for (Pictures picture : pictures) {
			String dirPath = ServletActionContext.getServletContext()
					.getRealPath("/uploadImages") + picture.getPicturesUrl();
			System.out.println(dirPath);
			File dirFile = new File(dirPath);
			dirFile.delete();
		}
		this.flag = baseService.deleteObjects(Pictures.class, ids);
		return "delete";
	}
	
	public String upload() {
		System.out.println("start uploading");
		String uplPath = "";
		SimpleDateFormat df = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");// 设置日期格式
		uplPath = "/" + df.format(new Date());
		// 设置上传的路径
		String path = ServletActionContext.getServletContext().getRealPath("/uploadImages");
		// 上传路径的文件
		File pfile = new File(path);
		// 文件的路径创建
		if (!pfile.exists()) {
			pfile.mkdirs();
		}
		try {
			if (upload != null) {
				String currentTime = System.currentTimeMillis() + "";
				int spilIndex = uploadFileName.lastIndexOf(".");
				String extName = uploadFileName.substring(spilIndex);
				FileUtils.copyFile(upload, new File(pfile, uplPath + "_"
						+ currentTime + extName));
				finalPath = uplPath + "_" + currentTime + extName;
				System.out.println("uploadsucceed" + finalPath);
				
				return "uploadsucceed";
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "uploadfail";
	}
	//微博图片接口
	public String iosUploadWeiboPic() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String messageId = request.getParameter("messageId");
		String fileName = request.getParameter("imageName");
		//MultiPartRequest mRequest = (MultiPartRequest)request;
		//MultiPartRequestWrapper req = (MultiPartRequestWrapper) request;
		
		MultiPartRequestWrapper multiWrapper = (MultiPartRequestWrapper) request; 
		File[] files = multiWrapper.getFiles("uploadHeadPics");  
		if(files == null){
			result = new ObjectResult("100", "获取不到上传的文件", null);
			return "iosUploadFail";
		}
		Messages message = (Messages)baseService.getObjectById(Messages.class, Integer.parseInt(messageId));
		String userId = message.getUsers().getUsersId().toString();
		Users user = (Users) baseService.getObjectById(Users.class,Integer.parseInt(userId));
		System.out.println("start uploading");
		String uplPath = "";
		uplPath = "/" + fileName;
		// 设置上传的路径
		String path = ServletActionContext.getServletContext().getRealPath("/uploadWeiboPics");
		// 上传路径的文件
		File pfile = new File(path);
		// 文件的路径创建
		if (!pfile.exists()) {
			pfile.mkdirs();
		}
		try {
			File uploadImage = files[0];
			String realPath = ServerURL + "" + uplPath;
			System.out.println(realPath);
			FileUtils.copyFile(uploadImage, new File(pfile, uplPath));
			System.out.println("uploadsucceed" + uplPath);
			Pictures weiboPic = new Pictures();
			Timestamp uploadTime = new Timestamp(System.currentTimeMillis());
			weiboPic.setPicturesTime(uploadTime);
			weiboPic.setPicturesUrl(realPath);
			weiboPic.setUsers(user);
			weiboPic.setPicturesType("微博");
			weiboPic.setMessages(message);
			//headPic.setPicturesTime(System.currentTimeMillis());
			
			//判断message中是否已经有了图片数组
			Set<Pictures> picSet = message.getPictureses();
			if (picSet == null) {
				picSet = new HashSet<Pictures>();
			}
			picSet.add(weiboPic);
			message.setPictureses(picSet);
			message.setMessagesLabel(path);
			//baseService.saveOrUpdateObject(user);
			baseService.saveObject(weiboPic);
			baseService.saveOrUpdateObject(message);
			result = new ObjectResult("0", "success", null);
			return "iosUploadWeiboPic";
		} catch (IOException e) {
			result = new ObjectResult("100", "false", null);
			e.printStackTrace();
		}
		return "iosUploadFail";
	}
	
	//上传用户头像
	public String iosUploadHeadPic() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String userId = request.getParameter("userId");
		String fileName = request.getParameter("imageName");
		MultiPartRequestWrapper multiWrapper = (MultiPartRequestWrapper) request; 
		File[] files = multiWrapper.getFiles("uploadHeadPics");  
		if(files == null){
			result = new ObjectResult("100", "获取不到上传的文件", null);
			return "iosUploadFail";
		}
		Users user = (Users) baseService.getObjectById(Users.class,Integer.parseInt(userId));
		System.out.println("start uploading");
		String uplPath = "";
		uplPath = "/" + fileName;
		// 设置上传的路径
		String path = ServletActionContext.getServletContext().getRealPath("/uploadHeadPics");
		// 上传路径的文件
		File pfile = new File(path);
		// 文件的路径创建
		if (!pfile.exists()) {
			pfile.mkdirs();
		}
		try {
			File uploadImage = files[0];
			
			FileUtils.copyFile(uploadImage, new File(pfile, uplPath));
			System.out.println("uploadsucceed" + uplPath);
			Pictures headPic = new Pictures();
			Timestamp uploadTime = new Timestamp(System.currentTimeMillis());
			headPic.setPicturesTime(uploadTime);
			headPic.setPicturesUrl(ServerURL + "" + uplPath);
			headPic.setUsers(user);
			headPic.setPicturesType("头像");
			//判断message中是否已经有了图片数组
			Set<Pictures> picSet = user.getPictureses();
			if (picSet == null) {
				picSet = new HashSet<Pictures>();
			}
			picSet.add(headPic);
			user.setPictureses(picSet);
			baseService.saveOrUpdateObject(user);
			baseService.saveObject(headPic);
			result = new ObjectResult("0", "success", null);
			return "iosUploadHeadPic";
		} catch (IOException e) {
			result = new ObjectResult("100", "false", null);
			e.printStackTrace();
		}
		return "iosUploadFail";
	}
	
	
	public String deletePictures() {
		//获取请求
		HttpServletRequest request = ServletActionContext.getRequest();
		//获取请求的用户
		Users loginUsers = (Users) request.getSession().getAttribute("user");
		//获取用户已有头像
		List<Pictures> headPicList = baseService.getObjects(
				Pictures.class, "where users.usersId=" + loginUsers.getUsersId()
						+ "and picturesType='头像'");
		if (headPicList.size() != 0) {
			Pictures headPic = headPicList.get(0);
			request.getSession().removeAttribute("headPic");
			request.getSession().setAttribute("headPic", headPic);
		}
		String dirPath = ServletActionContext.getServletContext().getRealPath(
				"/uploadImages/")
				+ delPicURL;

		System.out.println("deleting temp pictures-------" + dirPath);
		File dirFile = new File(dirPath);
		dirFile.delete();
		flag = true;
		return "deletePicturesSucceed";
	}
	public String cutImg() {
		String webPath = ServletActionContext.getServletContext().getRealPath(
				"/uploadImages");
		String cutImgPathTrue = webPath
				+ "/" + cutImgPath.substring(15, cutImgPath.length());
		System.out.println("cutImgPathTrue---------------" + cutImgPathTrue);
		try {
			System.out.println("start cutting--------");
			OperateImage o = new OperateImage(Integer.valueOf(cutImgX),
					Integer.valueOf(cutImgY), Integer.valueOf(cutImgW),
					Integer.valueOf(cutImgH));
			o.setSrcpath(cutImgPathTrue);
			SimpleDateFormat df = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");// 设置日期格式
			String currentTime = System.currentTimeMillis() + "";
			String subpath = webPath + "/" + df.format(new Date()) + "_"
					+ currentTime + ".jpg";
			o.setSubpath(subpath);
			o.cut();

			HttpSession httpSession = ServletActionContext.getRequest()
					.getSession();
			Users users = (Users) httpSession.getAttribute("user");
			
			String picUrl = "/" + df.format(new Date()) + "_" + currentTime
					+ ".jpg";
			System.out.println(picUrl);
			List<Pictures> images = baseService.getObjects(Pictures.class,
					"where users.usersId = " + users.getUsersId() + " and picturesType = '头像'");
			//System.out.println("got pictures");
			if (images.size() != 0) {		
				for (Pictures pic : images) {
					pic.setPicturesUrl(picUrl);
					pic.setPicturesTime(new Timestamp(System.currentTimeMillis()));
					baseService.saveOrUpdateObject(pic);
				}
				//System.out.println("succeed");
			} else {
				String headPic = "头像";
				
				Pictures pic = new Pictures(null,null, users, picUrl, headPic,new Timestamp(System.currentTimeMillis()));
				baseService.saveOrUpdateObject(pic);
				
			}

			// Pictures pic=new Pictures(null, picUrl, "头像", new
			// Timestamp(System.currentTimeMillis()), users, null);

			flag = true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "cutsucceed";
	}
	
}
