## 介绍
Kindle自带的屏保图片保存在`/usr/share/blanket/screensaver`目录中，对于已经越狱的设备，除了使用[ScreenSavers Hack](https://www.mobileread.com/forums/showthread.php?t=195474)插件外，也可以直接手动地增加、删除或替换上述路径中的图片来实现自定义屏保。这种方法不需要安装专门的插件，较为繁琐但更为安全稳定，适合动手能力强的极客。但是手动增加的图片往往集中于文件列表末尾（按文件名排序），在屏保轮换时也会按顺序出现。手动打乱文件命名费时费力易出错，因此我写了这个小插件。这是个KUAL插件，其核心是一个通用的文件名洗牌（即随机交换文件夹中文件名）脚本（[shufflenames.sh](./shufflenames.sh)），然后通过[menu.json](./menu.json)中的命令来打乱Kindle的屏保目录。洗牌算法使用了内部交换法（inside out algorithm），但是由于完全使用shell命令实现，限制颇多，时间复杂度为O(n^2)，可能并不用适于打乱特别大量的文件。
## 插件的安装与使用
* 克隆项目或前往[Release页面](https://github.com/guo-yong-zhi/ShuffleSS/releases)下载并解压
* 将项目文件夹复制到Kindle根目录下的extensions目录中
* 打开`KUAL`，依次点击`Tools` -> `ShuffleSS`。执行成功会提示`shuffle success`
## 关于屏保图片和目录的提示
* 通过USB连接Kindle并看不到`/usr/share/blanket/screensaver`目录，这是系统内部目录。你可以安装[`kindle-filebrowser`](https://github.com/guo-yong-zhi/kindle-filebrowser)，为管理内部目录，你需要点击【Start (root path)】来启动它。
* 修改前需要执行shell命令`mntroot rw`来打开写权限，结束后执行`mntroot ro`关闭。为此你可能需要安装`kterm`或[`KOSSH`](https://github.com/guo-yong-zhi/KOSSH)等终端。
* 新增的屏保图片需遵循命名规律，即从`00`开始的`bg_ss??.png`
* 新增的图片需要满足一定的格式要求，如分辨率和色彩空间，可以参考自带屏保图片的格式或参见[这个链接](https://bookfere.com/post/470.html)。
* 另外，`/usr/share/blanket/splash`、`/usr/share/blanket/shutdown`中，以及`/usr/share/blanket/bg_default.png`是开机和重启的画面图片，同样可以替换。
* 注意`mntroot rw`后可以删除和修改任何文件，错误的操作可能会造成系统崩溃，所以请谨慎对待你不了解的文件。