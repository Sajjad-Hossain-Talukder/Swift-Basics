import UIKit

var greeting = "Hello, playground"
print(greeting)


struct ProjectItemEach {
    var title : String
    var image : String
}

class ProjectItemModel {
    var projectItem = [ProjectItemEach]()
    static var items = ProjectItemModel()
}

class workingDirectory  {
   
    func populate() {
        ProjectItemModel.items.projectItem.append(
            ProjectItemEach(title: "Sajjad", image: " Sajajd Image ")
        )
        ProjectItemModel.items.projectItem.append(
            ProjectItemEach(title: "Sajjad2", image: " Sajajd2 Image ")
        )
        print(ProjectItemModel.items.projectItem)
    }
}

var obje = workingDirectory()
obje.populate()



