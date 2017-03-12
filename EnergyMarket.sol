pragma solidity ^0.4.2;

contract SupplierContract 
{
	enum Status { OnTarget, LowerThanTarget, HigherThanTarget }

	struct Supplier {		
		uint deposited;
		uint fineRate;
		uint target;
		uint allowedRange;
		uint pendingPayment;	
	}

	struct Consumer {
		uint deposited;
		uint fineRate;
		uint target;
		uint allowedRange;	
		uint pendingPayment;	
	}

	// Contract is owned by a supplier
	address owner;
	Supplier supplier;

	// Addresse that is supplier or consumer;
	mapping (address => bool) registered;

	mapping (address => Consumer) consumerList;
	
	function SupplierContract(supplierFineRate, supplierTarget, supplierAllowedRange);

	// Supplier add consumers to the contract
	function newConsumer(fineRate, target, allowedRange) onlyOwner;

	// Set status of supplier/cosumer according to the reported rate
	function reportGenerated() onlyOwner;
	function reportConsumed() onlyConsumer;

	// Calculate fines according to status
	function calculateFine() internal;

	// Deposit/withdraw for supplier/cosumer
	function deposit() onlyRegistered;
	function withdraw() onlyRegistered;
}

contract EnergyMarket {
	address[] contractList;

	function newContract(uint supplierFineRate, uint supplierTarget, uint supplierSafeRange);
}