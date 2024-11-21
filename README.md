# EnvDock（环境码头）项目详细介绍

## 项目介绍
EnvDock是一个智能的依赖环境管理系统，旨在简化软件依赖项的处理。它提供了一个集中的元数据中心，使得跨平台的依赖管理变得高效。系统支持依赖项的下载、查找、更新、修改和卸载，确保开发环境的一致性和可靠性。

## 部署流程

### 环境准备
- 确保Python环境已安装（推荐使用Python 3.8及以上版本）。
- 安装MySQL数据库，并创建名为`dependency_manager`的数据库。

### 安装依赖
在项目根目录下运行以下命令安装所需Python依赖：
```bash
pip install -r requirements.txt
```

### 数据库配置
在`app/database/db.py`中配置数据库连接信息。

### 运行项目
在项目根目录下运行以下命令启动项目：

```bash
python app/main.py
```

## 文件结构
以下是EnvDock项目的文件结构概览：
EnvDock/
│
├── app/                   # 应用主目录
│   ├── __init__.py
│   ├── main.py             # 应用的入口点
│   ├── database/           # 数据库操作模块
│   │   ├── __init__.py
│   │   ├── models.py       # 定义数据库模型
│   │   └── db.py           # 数据库连接和会话管理
│   ├── scripts/            # 存储一键部署脚本
│   │   └── deployment.sh
│   ├── utils/              # 辅助功能模块
│   │   └── helpers.py       # 辅助函数
│   └── tests/              # 测试目录
│
├── requirements.txt        # 项目依赖文件
├── .gitignore             # Git忽略文件配置
└── README.md              # 项目说明文档

- app/main.py
应用的主入口，负责启动Web服务器。

- app/database/models.py
定义与数据库表对应的Python模型。

- app/database/db.py
包含数据库连接和会话管理的逻辑。

- app/scripts/deployment.sh
示例一键部署脚本，可以根据项目需求进行修改。

- app/utils/helpers.py
包含一些辅助函数，如日志记录、错误处理等。

- requirements.txt
列出项目所需的Python依赖库。

- gitignore
配置Git版本控制忽略的文件和目录。

- README.md
项目说明文档，包含项目介绍、部署指南和使用说明。

