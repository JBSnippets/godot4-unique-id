# <img src="https://raw.githubusercontent.com/JBSnippets/godot4-unique-id/main/jbs_unique_id_512.png" width="32" height="32" /> Unique ID node ~ Godot 4+
A custom Godot 4+ node that generates a unique ID to be concatenated to, or replace the parent node's name.

This node can be added as a child of an existing node. The parent node will then have its name either concatenated with the ID or replaced by the ID.

## 🧬 Features
- Can generate 3 different length of unique ID: Short, Medium, Long.
- Ability to concatenate the ID to parent name or replace the parent name.
- Option to add a string separator when concatenating the ID.
- Automatically free this custom node after generating the unique ID.

## 💽 Supported Versions
<img src="https://img.shields.io/badge/Godot-v4.1.1-%23478cbf?logo=godot-engine&logoColor=cyian&color=blue"> <img src="https://img.shields.io/badge/Godot-v4.1.2-%23478cbf?logo=godot-engine&logoColor=cyian&color=blue"> <img src="https://img.shields.io/badge/Godot-v4.1.3-%23478cbf?logo=godot-engine&logoColor=cyian&color=blue"> <img src="https://img.shields.io/badge/Godot-v4.1.4-%23478cbf?logo=godot-engine&logoColor=cyian&color=blue"> <img src="https://img.shields.io/badge/Godot-v4.2.0-%23478cbf?logo=godot-engine&logoColor=cyian&color=blue"> <img src="https://img.shields.io/badge/Godot-v4.2.1-%23478cbf?logo=godot-engine&logoColor=cyian&color=blue"> <img src="https://img.shields.io/badge/Godot-v4.2.2-%23478cbf?logo=godot-engine&logoColor=cyian&color=blue">

## 📥 Installing the Plugin
### Install using Godot's AssetLib

1. Go to the `AssetLib` in the Godot Editor.
1. Type "unique" to search for the `UniqueId` node.
1. Select the asset and click Download.

### Install with examples

- Download as a ZIP file from this repository or
- Clone this repository

## 🚀 How to use
After enabling this plugin, you can add the `UniqueId` node as a child of another node and it will add or replace a Unique ID to the parent node.

1. Right-click on a node or press Ctrl+A.
2. Type "unique" on the Search textbox of the Create New Node form to filter the node list and easily find the `UniqueId` node.

![Add Node](https://github.com/JBSnippets/godot4-unique-id/blob/main/assets/add_node.png)
3. Double-click the `UniqueId` node to add as a child of the node.

## Video on How I created and use the plugin.
<iframe width="560" height="315" src="https://www.youtube.com/embed/Orj3tYSlQsc&t=22s" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## 📝 Notes
- Adding more than one `UniqueId` node will result in creating a sequence of Unique IDs. The IDs will either be concatenated or replace the parent name, which ever comes first.
- Adding the `UniqueId` node as the only node, or a child of the root node, will result in changing the name of the root node.
