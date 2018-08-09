@dm_trunk
@dm_bond
Feature: DM Bond

  Scenario: 异常价格 - 高收益债
    Given visit 异常价格 - 高收益债
    And click 异常价格 - 高收益债 - 成交价
    And click 异常价格 - 高收益债 - 买入报价
    And click 异常价格 - 高收益债 - 卖出报价

  Scenario: 异常价格 - 估值偏高
    Given visit 异常价格 - 估值偏高
