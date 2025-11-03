from player_reader import PlayerReader
from enum import Enum

class SortBy(Enum):
    POINTS = 1
    GOALS = 2
    ASSISTS = 3


class StatisticsService:
    def __init__(self, PlayerReader):
        reader = PlayerReader()
        self._players = reader.get_players()

    def search(self, name):
        for player in self._players:
            if name in player.name:
                return player

        return None

    def team(self, team_name):
        players_of_team = filter(
            lambda player: player.team == team_name,
            self._players
        )

        return list(players_of_team)

    def top(self, how_many, sort_by=None):
        
        if sort_by is None:
            sort_by = SortBy.POINTS
        
        sort_keys = {
            SortBy.POINTS: lambda player: player.points,
            SortBy.GOALS: lambda player: player.goals,
            SortBy.ASSISTS: lambda player: player.assists
        }
        
        sort_key = sort_keys.get(sort_by, lambda player: player.points)

        sorted_players = sorted(
            self._players,
            reverse=True,
            key=sort_key
        )

        return sorted_players[:how_many]