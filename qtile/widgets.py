from libqtile import bar, widget
from libqtile.widget import TaskList

class GroupTaskList(TaskList):
    def __init__(self, group_name, **config):
        TaskList.__init__(self, **config)
        self.group_name = group_name

    @property
    def windows(self):
        group = next((g for g in self.qtile.groups if g.name == self.group_name), None)
        if group:
            return group.windows
        return []

