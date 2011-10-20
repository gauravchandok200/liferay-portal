<%--
/**
 * Copyright (c) 2000-2011 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ page import="com.liferay.portal.kernel.repository.model.FileEntry" %>
<%@ page import="com.liferay.portal.kernel.util.HtmlUtil" %>
<%@ page import="com.liferay.portal.kernel.util.HttpUtil" %>
<%@ page import="com.liferay.portal.kernel.util.StringBundler" %>
<%@ page import="com.liferay.portal.kernel.util.StringPool" %>
<%@ page import="com.liferay.portal.theme.ThemeDisplay" %>
<%@ page import="com.liferay.portal.webserver.WebServerServletTokenUtil" %>

<%!
private static final String _getFileEntryImage(FileEntry fileEntry, ThemeDisplay themeDisplay) {
	StringBundler sb = new StringBundler(5);

	sb.append("<img style=\"border-width: 0; text-align: left;\" src=\"");
	sb.append(themeDisplay.getPathThemeImages());
	sb.append("/file_system/small/");
	sb.append(fileEntry.getIcon());
	sb.append(".png\">");

	return sb.toString();
}

private static final String _getPreviewURL(FileEntry fileEntry, String title, String version, ThemeDisplay themeDisplay, String queryString) {
	return _getPreviewURL(fileEntry, title, version, themeDisplay, queryString, true);
}

private static final String _getPreviewURL(FileEntry fileEntry, String title, String version, ThemeDisplay themeDisplay, String queryString, boolean appendToken) {
	StringBundler sb = new StringBundler(13);

	sb.append(themeDisplay.getPortalURL());
	sb.append(themeDisplay.getPathContext());
	sb.append("/documents/");
	sb.append(fileEntry.getRepositoryId());
	sb.append(StringPool.SLASH);
	sb.append(fileEntry.getFolderId());
	sb.append(StringPool.SLASH);
	sb.append(HttpUtil.encodeURL(HtmlUtil.unescape(title)));
	sb.append("?version=");
	sb.append(version);

	if (appendToken) {
		sb.append("&t=");
		sb.append(WebServerServletTokenUtil.getToken(fileEntry.getFileEntryId()));
	}

	sb.append(queryString);

	return sb.toString();
}
%>