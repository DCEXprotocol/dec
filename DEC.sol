pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";

contract DEC is ERC20, AccessControl {

    using Address for address;

    using SafeMath for uint256;

    uint256 public invite_amount = 0.01 * 10 ** 18;

    uint256 public ht_amount = 1 * 10 ** 18;

    uint256 public back_amount = 10 * 10 ** 18;

    uint256 public init_count = 10000;

    uint256 public start_time = 0;

    uint256 public start_issue = 0;

    uint256 public discount_amount = 10000 * 10 ** 18;

    uint256 public min_amount = 20000 * 10 ** 18;

    uint256 public constant INIT_MINE_SUPPLY = 97000000 * 10 ** 18;

    uint256[] public issueInfo;

    uint256 public constant MONTH_SECONDS = 30 * 24 * 60 * 60;

    uint256 public constant DAY_SECONDS = 24 * 60 * 60;

    bytes32 public constant DEC_ROLE = keccak256("DEC_ROLE");

    bytes32 public constant INIT_ROLE = keccak256("INIT_ROLE");

    mapping(address => address) public relation;

    mapping(address => uint256) public invitor;

    mapping(address => uint256) public discounts;

    uint256 public total_issue = 8.8 * 10 ** 8 * 10 ** 18;

    uint256 public surplusAmount = 7.83 * 10 ** 8 * 10 ** 18;

    uint256 public issuedAmount = 0;

    constructor(uint256 initialSupply) public ERC20("DEC", "DEC") payable{
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
        _mint(_msgSender(), initialSupply);

        issueInfo.push(6600000 * 10 ** 18);
        issueInfo.push(6567000 * 10 ** 18);
        issueInfo.push(6534165 * 10 ** 18);
        issueInfo.push(6501494.175 * 10 ** 18);
        issueInfo.push(6468986.704124999 * 10 ** 18);
        issueInfo.push(6436641.770604375 * 10 ** 18);
        issueInfo.push(6404458.561751354 * 10 ** 18);
        issueInfo.push(6372436.268942596 * 10 ** 18);
        issueInfo.push(6340574.087597883 * 10 ** 18);
        issueInfo.push(6308871.217159893 * 10 ** 18);
        issueInfo.push(6277326.861074095 * 10 ** 18);
        issueInfo.push(6245940.226768724 * 10 ** 18);
        issueInfo.push(6214710.52563488 * 10 ** 18);
        issueInfo.push(6183636.973006706 * 10 ** 18);
        issueInfo.push(6152718.7881416725 * 10 ** 18);
        issueInfo.push(6121955.194200964 * 10 ** 18);
        issueInfo.push(6091345.418229959 * 10 ** 18);
        issueInfo.push(6060888.691138809 * 10 ** 18);
        issueInfo.push(6030584.247683115 * 10 ** 18);
        issueInfo.push(6000431.326444699 * 10 ** 18);
        issueInfo.push(5970429.169812476 * 10 ** 18);
        issueInfo.push(5940577.023963413 * 10 ** 18);
        issueInfo.push(5910874.138843597 * 10 ** 18);
        issueInfo.push(5881319.768149379 * 10 ** 18);
        issueInfo.push(5851913.169308632 * 10 ** 18);
        issueInfo.push(5822653.603462089 * 10 ** 18);
        issueInfo.push(5793540.335444777 * 10 ** 18);
        issueInfo.push(5764572.633767554 * 10 ** 18);
        issueInfo.push(5735749.770598715 * 10 ** 18);
        issueInfo.push(5707071.021745723 * 10 ** 18);
        issueInfo.push(5678535.666636994 * 10 ** 18);
        issueInfo.push(5650142.988303809 * 10 ** 18);
        issueInfo.push(5621892.27336229 * 10 ** 18);
        issueInfo.push(5593782.811995478 * 10 ** 18);
        issueInfo.push(5565813.8979355 * 10 ** 18);
        issueInfo.push(5537984.828445823 * 10 ** 18);
        issueInfo.push(5510294.904303594 * 10 ** 18);
        issueInfo.push(5482743.429782077 * 10 ** 18);
        issueInfo.push(5455329.7126331655 * 10 ** 18);
        issueInfo.push(5428053.064069999 * 10 ** 18);
        issueInfo.push(5400912.79874965 * 10 ** 18);
        issueInfo.push(5373908.234755902 * 10 ** 18);
        issueInfo.push(5347038.693582122 * 10 ** 18);
        issueInfo.push(5320303.500114212 * 10 ** 18);
        issueInfo.push(5293701.982613641 * 10 ** 18);
        issueInfo.push(5267233.472700572 * 10 ** 18);
        issueInfo.push(5240897.30533707 * 10 ** 18);
        issueInfo.push(5214692.818810385 * 10 ** 18);
        issueInfo.push(5188619.354716333 * 10 ** 18);
        issueInfo.push(5162676.25794275 * 10 ** 18);
        issueInfo.push(5136862.876653036 * 10 ** 18);
        issueInfo.push(5111178.5622697715 * 10 ** 18);
        issueInfo.push(5085622.669458422 * 10 ** 18);
        issueInfo.push(5060194.55611113 * 10 ** 18);
        issueInfo.push(5034893.583330574 * 10 ** 18);
        issueInfo.push(5009719.115413922 * 10 ** 18);
        issueInfo.push(4984670.519836852 * 10 ** 18);
        issueInfo.push(4959747.167237667 * 10 ** 18);
        issueInfo.push(4934948.431401479 * 10 ** 18);
        issueInfo.push(4910273.689244472 * 10 ** 18);
        issueInfo.push(4885722.32079825 * 10 ** 18);
        issueInfo.push(4861293.709194259 * 10 ** 18);
        issueInfo.push(4836987.240648287 * 10 ** 18);
        issueInfo.push(4812802.304445045 * 10 ** 18);
        issueInfo.push(4788738.292922821 * 10 ** 18);
        issueInfo.push(4764794.601458206 * 10 ** 18);
        issueInfo.push(4740970.628450915 * 10 ** 18);
        issueInfo.push(4717265.77530866 * 10 ** 18);
        issueInfo.push(4693679.446432117 * 10 ** 18);
        issueInfo.push(4670211.0491999565 * 10 ** 18);
        issueInfo.push(4646859.993953956 * 10 ** 18);
        issueInfo.push(4623625.693984187 * 10 ** 18);
        issueInfo.push(4600507.5655142665 * 10 ** 18);
        issueInfo.push(4577505.027686695 * 10 ** 18);
        issueInfo.push(4554617.502548262 * 10 ** 18);
        issueInfo.push(4531844.41503552 * 10 ** 18);
        issueInfo.push(4509185.192960343 * 10 ** 18);
        issueInfo.push(4486639.266995541 * 10 ** 18);
        issueInfo.push(4464206.070660563 * 10 ** 18);
        issueInfo.push(4441885.04030726 * 10 ** 18);
        issueInfo.push(4419675.615105723 * 10 ** 18);
        issueInfo.push(4397577.237030195 * 10 ** 18);
        issueInfo.push(4375589.350845044 * 10 ** 18);
        issueInfo.push(4353711.404090819 * 10 ** 18);
        issueInfo.push(4331942.847070364 * 10 ** 18);
        issueInfo.push(4310283.132835013 * 10 ** 18);
        issueInfo.push(4288731.717170838 * 10 ** 18);
        issueInfo.push(4267288.058584983 * 10 ** 18);
        issueInfo.push(4245951.618292059 * 10 ** 18);
        issueInfo.push(4224721.860200599 * 10 ** 18);
        issueInfo.push(4203598.250899595 * 10 ** 18);
        issueInfo.push(4182580.259645097 * 10 ** 18);
        issueInfo.push(4161667.3583468716 * 10 ** 18);
        issueInfo.push(4140859.0215551374 * 10 ** 18);
        issueInfo.push(4120154.7264473615 * 10 ** 18);
        issueInfo.push(4099553.952815125 * 10 ** 18);
        issueInfo.push(4079056.1830510492 * 10 ** 18);
        issueInfo.push(4058660.902135794 * 10 ** 18);
        issueInfo.push(4038367.597625115 * 10 ** 18);
        issueInfo.push(4018175.7596369893 * 10 ** 18);
        issueInfo.push(3998084.8808388044 * 10 ** 18);
        issueInfo.push(3978094.4564346103 * 10 ** 18);
        issueInfo.push(3958203.9841524367 * 10 ** 18);
        issueInfo.push(3938412.9642316755 * 10 ** 18);
        issueInfo.push(3918720.899410517 * 10 ** 18);
        issueInfo.push(3899127.2949134647 * 10 ** 18);
        issueInfo.push(3879631.6584388968 * 10 ** 18);
        issueInfo.push(3860233.5001467024 * 10 ** 18);
        issueInfo.push(3840932.332645969 * 10 ** 18);
        issueInfo.push(3821727.6709827394 * 10 ** 18);
        issueInfo.push(3802619.032627825 * 10 ** 18);
        issueInfo.push(3783605.9374646856 * 10 ** 18);
        issueInfo.push(3764687.907777363 * 10 ** 18);
        issueInfo.push(3745864.468238476 * 10 ** 18);
        issueInfo.push(3727135.145897283 * 10 ** 18);
        issueInfo.push(3708499.4701677966 * 10 ** 18);
        issueInfo.push(3689956.9728169576 * 10 ** 18);
        issueInfo.push(3671507.187952873 * 10 ** 18);
        issueInfo.push(3653149.652013109 * 10 ** 18);
        issueInfo.push(3634883.903753043 * 10 ** 18);
        issueInfo.push(3616709.484234278 * 10 ** 18);
        issueInfo.push(3598625.9368131068 * 10 ** 18);
        issueInfo.push(3580632.8071290413 * 10 ** 18);
        issueInfo.push(3562729.643093396 * 10 ** 18);
        issueInfo.push(3544915.9948779284 * 10 ** 18);
        issueInfo.push(3527191.4149035392 * 10 ** 18);
        issueInfo.push(3509555.457829022 * 10 ** 18);
        issueInfo.push(3492007.6805398767 * 10 ** 18);
        issueInfo.push(3474547.642137177 * 10 ** 18);
        issueInfo.push(3457174.903926491 * 10 ** 18);
        issueInfo.push(3439889.029406858 * 10 ** 18);
        issueInfo.push(3422689.584259824 * 10 ** 18);
        issueInfo.push(3405576.1363385255 * 10 ** 18);
        issueInfo.push(3388548.255656833 * 10 ** 18);
        issueInfo.push(3371605.514378548 * 10 ** 18);
        issueInfo.push(3354747.486806656 * 10 ** 18);
        issueInfo.push(3337973.7493726225 * 10 ** 18);
        issueInfo.push(3321283.880625759 * 10 ** 18);
        issueInfo.push(3304677.46122263 * 10 ** 18);
        issueInfo.push(3288154.073916517 * 10 ** 18);
        issueInfo.push(3271713.303546935 * 10 ** 18);
        issueInfo.push(3255354.7370291995 * 10 ** 18);
        issueInfo.push(3239077.963344054 * 10 ** 18);
        issueInfo.push(3222882.573527334 * 10 ** 18);
        issueInfo.push(3206768.160659697 * 10 ** 18);
        issueInfo.push(3190734.3198563983 * 10 ** 18);
        issueInfo.push(3174780.6482571163 * 10 ** 18);
        issueInfo.push(3158906.7450158307 * 10 ** 18);
        issueInfo.push(3143112.2112907516 * 10 ** 18);
        issueInfo.push(3127396.650234298 * 10 ** 18);
        issueInfo.push(3111759.666983126 * 10 ** 18);
        issueInfo.push(3096200.8686482105 * 10 ** 18);
        issueInfo.push(3080719.8643049696 * 10 ** 18);
        issueInfo.push(3065316.264983445 * 10 ** 18);
        issueInfo.push(3049989.6836585277 * 10 ** 18);
        issueInfo.push(3034739.735240235 * 10 ** 18);
        issueInfo.push(3019566.0365640335 * 10 ** 18);
        issueInfo.push(3004468.2063812134 * 10 ** 18);
        issueInfo.push(2989445.865349307 * 10 ** 18);
        issueInfo.push(2974498.6360225608 * 10 ** 18);
        issueInfo.push(2959626.1428424483 * 10 ** 18);
        issueInfo.push(2944828.012128236 * 10 ** 18);
        issueInfo.push(2930103.8720675944 * 10 ** 18);
        issueInfo.push(2915453.3527072566 * 10 ** 18);
        issueInfo.push(2900876.0859437203 * 10 ** 18);
        issueInfo.push(2886371.7055140017 * 10 ** 18);
        issueInfo.push(2871939.846986432 * 10 ** 18);
        issueInfo.push(2857580.1477515 * 10 ** 18);
        issueInfo.push(2843292.247012742 * 10 ** 18);
        issueInfo.push(2829075.7857776782 * 10 ** 18);
        issueInfo.push(2814930.40684879 * 10 ** 18);
        issueInfo.push(2800855.754814546 * 10 ** 18);
        issueInfo.push(2786851.476040473 * 10 ** 18);
        issueInfo.push(2772917.218660271 * 10 ** 18);
        issueInfo.push(2759052.6325669694 * 10 ** 18);
        issueInfo.push(2745257.3694041343 * 10 ** 18);
        issueInfo.push(2731531.082557114 * 10 ** 18);
        issueInfo.push(2717873.4271443286 * 10 ** 18);
        issueInfo.push(2704284.060008607 * 10 ** 18);
        issueInfo.push(2690762.6397085637 * 10 ** 18);
        issueInfo.push(2677308.8265100205 * 10 ** 18);
        issueInfo.push(2663922.2823774708 * 10 ** 18);
        issueInfo.push(2650602.670965583 * 10 ** 18);
    }

    function issueInfoLength() external view returns (uint256) {
        return issueInfo.length;
    }

    function currentCanIssueAmount() public view returns (uint256){
        uint256 currentTime = block.timestamp;
        if (currentTime <= start_issue || start_issue <= 0) {
            return 0;
        }
        uint256 timeInterval = currentTime - start_issue;
        uint256 monthIndex = timeInterval.div(MONTH_SECONDS);
        uint256 dayIndex = timeInterval.div(DAY_SECONDS);
        if (monthIndex < 1) {
            return issueInfo[monthIndex].div(30).mul(dayIndex).sub(issuedAmount);
        } else if (monthIndex < issueInfo.length) {
            uint256 tempTotal = INIT_MINE_SUPPLY;
            for (uint256 j = 0; j < monthIndex; j++) {
                tempTotal = tempTotal.add(issueInfo[j]);
            }
            uint256 calcAmount = dayIndex.sub(monthIndex.mul(30)).mul(issueInfo[monthIndex].div(30)).add(tempTotal);
            if (calcAmount > total_issue) {
                return total_issue.sub(issuedAmount);
            }
            return calcAmount.sub(issuedAmount);
        } else {
            return total_issue.sub(issuedAmount);
        }
    }

    function currentDayCanIssueAmount() public view returns (uint256){
        uint256 currentTime = block.timestamp;
        if (currentTime <= start_issue || start_issue <= 0) {
            return 0;
        }
        uint256 timeInterval = currentTime - start_issue;
        uint256 monthIndex = timeInterval.div(MONTH_SECONDS);
        uint256 dayIndex = timeInterval.div(DAY_SECONDS);
        if (monthIndex < 1) {
            return issueInfo[monthIndex].div(30);
        } else if (monthIndex < issueInfo.length) {
            uint256 tempTotal = INIT_MINE_SUPPLY;
            for (uint256 j = 0; j < monthIndex; j++) {
                tempTotal = tempTotal.add(issueInfo[j]);
            }
            uint256 actualDayIssue = issueInfo[monthIndex].div(30);
            uint256 calcAmount = dayIndex.sub(monthIndex.mul(30)).mul(issueInfo[monthIndex].div(30)).add(tempTotal);
            if (calcAmount > total_issue) {
                if (calcAmount.sub(total_issue) <= actualDayIssue) {
                    return actualDayIssue.sub(calcAmount.sub(total_issue));
                }
                return 0;
            }
            return actualDayIssue;
        } else {
            return 0;
        }

    }

    function issueAnyOne() public {
        uint256 currentCanIssue = currentCanIssueAmount();
        if (currentCanIssue > 0) {
            issuedAmount = issuedAmount.add(currentCanIssue);
            surplusAmount = surplusAmount.sub(currentCanIssue);
            _mint(address(this), currentCanIssue);
        }
    }

    function startIssue() public {
        require(hasRole(DEFAULT_ADMIN_ROLE, _msgSender()), "Caller is not a admin");
        require(start_issue <= 0, "can't set,already start");
        start_issue = block.timestamp;
    }

    function start() public {
        require(hasRole(DEFAULT_ADMIN_ROLE, _msgSender()), "Caller is not a admin");
        require(start_time <= 0, "can't set,already start");
        start_time = block.timestamp;
    }


    function _beforeTokenTransfer(address from, address to, uint256 value) internal virtual override {
        if (!(to.isContract()) && !(from.isContract()) && value >= invite_amount && relation[from] == address(0) && !hasRole(DEC_ROLE, from) && hasRole(DEC_ROLE, to)) {
            relation[from] = to;
            _setupRole(DEC_ROLE, from);
            invitor[to] = invitor[to].add(1);
            if (invitor[to] == 10) {
                discounts[to] = discount_amount;
            }
        }
        super._beforeTokenTransfer(from, to, value);
    }

    function withdrawETH() public {
        require(hasRole(DEFAULT_ADMIN_ROLE, _msgSender()), "Caller is not a admin");
        msg.sender.transfer(address(this).balance);
    }

    function withdrawToken(address addr) public {
        require(hasRole(DEFAULT_ADMIN_ROLE, _msgSender()), "Caller is not a admin");
        if (addr == address(this)) {
            _transfer(address(this), _msgSender(), balanceOf(address(this)));
        } else {
            ERC20(addr).transfer(_msgSender(), ERC20(addr).balanceOf(address(this)));
        }
    }

    receive() external payable {
        if (!(Address.isContract(_msgSender())) && getRoleMemberCount(INIT_ROLE) < init_count && start_time > 0 && uint256(block.timestamp) <= start_time.add(30 * 24 * 60 * 60)) {
            if (!hasRole(INIT_ROLE, _msgSender()) && msg.value >= ht_amount) {
                _setupRole(INIT_ROLE, _msgSender());
                _setupRole(DEC_ROLE, _msgSender());
                ERC20(address(this)).transfer(_msgSender(), back_amount);
            }
        }
    }
}