// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

// NOTE: This file is autogenerated via `mud deploy-contracts` and `mud deploy`. Do not edit manually.

// MUD
import { IDeploy } from "std-contracts/test/MudTest.t.sol";
import { IWorld } from "solecs/interfaces/IWorld.sol";

// Foundry
import {DSTest} from "ds-test/test.sol";
import {Vm} from "forge-std/Vm.sol";
import {console} from "forge-std/console.sol";

// Libraries
import {LibDeploy, DeployResult} from "./LibDeploy.sol";

contract Deploy is DSTest, IDeploy {
  Vm internal immutable vm = Vm(HEVM_ADDRESS);

  function deploy(address deployer) external returns (IWorld world) {
    vm.startPrank(deployer);
    DeployResult memory result = LibDeploy.deploy(deployer, address(0), false);
    world = result.world;
    vm.stopPrank();
  }

  function broadcastDeploy(
    address _deployer,
    address _world,
    bool _reuseComponents
  ) public returns (address world, uint256 initialBlockNumber) {
    vm.startBroadcast(_deployer);
    initialBlockNumber = block.number;
    DeployResult memory result = LibDeploy.deploy(_deployer, _world, _reuseComponents);
    vm.stopBroadcast();
    world = address(result.world);
  }
}
