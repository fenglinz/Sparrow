var KindReady = function (K) {

	// 设置 KindEditor 主题样式（default、simple、simpleAndUpload）
	K.themes = {
		'default': K.options.items,
		'simple': ['source', '|', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', 'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', 'insertunorderedlist', 'link', '|', 'clearhtml', 'quickformat', '|', 'fullscreen'],
		'simpleAndUpload': ['source', '|', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', 'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', 'insertunorderedlist', '|', 'image', 'multiimage', '|', 'clearhtml', 'quickformat', '|', 'fullscreen']
	}

	// 设置 KindEditor 默认配置
	//K.options.afterCreate = function (e) { try { editor_onCreate(editor) } catch (e) { } }
	K.options.afterBlur = function (e) { this.sync(); try { editor_onBlur(this.html()) } catch (e) { } } // 编辑器失去焦点后执行的回调函数
	K.options.afterChange = function (e) { this.sync() } // 编辑器内容发生变化后执行的回调函数
	K.options.fullscreenShortcut = true; //全屏快捷键开启
	//K.options.pasteType = 1; //粘贴模式（0：禁止粘贴；1：仅文本；2：html）
	//K.options.autoHeightMode = true; //自动调节高度 //有问题，暂时取消
	K.options.allowUpload = true; K.options.uploadJson = '/KindEditor/Upload'; // 设置 upload 插件
	K.options.allowFileManager = true; K.options.fileManagerJson = '/KindEditor/UploadManager'; // 设置 fileManager 插件
	K.options.minWidth = 400; // 设置 最小宽度
	K.options.filterMode = false; // 不过滤任何html标签。默认为true
	K.options.fillDescAfterUploadImage = true; // 图片上传成功后是否切换到图片编辑标签，false时插入图片后关闭弹出框。默认为false
	K.options.basePath = '/Scripts/kindeditor-4.1.10/';
	K.options.themesPath = K.options.basePath + 'themes/';
	K.options.pluginsPath = K.options.basePath + 'plugins/';
	K.options.langPath = K.options.basePath + 'lang/';

	var editor = K.editor();
	K.loadStyle(editor.themesPath + editor.themeType + '/' + editor.themeType + '.css');

	// 初始化编辑器
	K('[editor="kindeditor"]').each(function (index, element) {
		var opt = { width: 500, height: 400, theme: 'simple', afterCreate: function () { try { editor_onCreate(this) } catch (e) { } } }
		if (K(element).attr('editor-width')) opt.width = K(element).attr('editor-width');
		if (K(element).attr('editorwidth')) opt.width = K(element).attr('editorwidth');
		if (K(element).attr('editor-height')) opt.height = K(element).attr('editor-height');
		if (K(element).attr('editorheight')) opt.height = K(element).attr('editorheight');
		if (K(element).attr('editor-theme')) opt.items = K.themes[K(element).attr('editor-theme')];
		if (K(element).attr('editortheme')) opt.items = K.themes[K(element).attr('editortheme')];
		K.create(K(element), opt);
	});

	// 初始化文件管理插件
	K('[data-toggle=filemanager]').each(function (index, element) {
		K(this).bind('click', function () {
			var _tar = $(this).parents('form').find('#' + $(this).attr('data-target'));
			editor.loadPlugin('filemanager', function () { editor.plugin.filemanagerDialog({ viewType: 'VIEW', dirName: 'image', clickFn: function (url, title) { _tar.val(url); editor.hideDialog() } }) })
		})
	})
	//K('[data-action="upload"][power="kindeditor"]').each(function (index, element) {
	//	var uploadbutton = K.uploadbutton({
	//		button: K(element),
	//		fieldName: 'imgFile',
	//		url: '/KindEditor/Upload',
	//		afterUpload: function (data) {
	//			if (data.error === 0) { K(K(element).attr('target')).val(data.url) } else { alert(data.message) }
	//		}
	//	}).fileBox.change(function (e) {
	//		uploadbutton.submit();
	//	});
	//})

}

window.KindEditor.ready(function (K) { KindReady(K) });
