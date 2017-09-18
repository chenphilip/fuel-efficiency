/*!
 *  ViewController.m
 *  Fuel Efficiency
 *
 *  @version       2017.09.16
 *  @author        Philip Chen
 *  @license       https://opensource.org/licenses/GPL-3.0
 */

#import "ViewController.h"

double getMilesPerGallon (double miles, double litres) {
    double myMPG;
    double gallons;
    
    gallons = litres / 3.78541;
    
    myMPG = miles / gallons;
    return myMPG;
}

double getL100km (double miles, double litres) {
    double myL100km;
    double kiloMetres;
    
    kiloMetres = miles * 1.60934;
    
    myL100km = (100 * litres) / kiloMetres;
    return myL100km;
}

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputLitres;
@property (weak, nonatomic) IBOutlet UITextField *inputMiles;
@property (weak, nonatomic) IBOutlet UILabel *reportOutput;

@end

@implementation ViewController
- (IBAction)calcuateEfficiency:(id)sender {
    NSMutableString *buf = [NSMutableString new];
    
    double litres = [self.inputLitres.text doubleValue];
    double miles = [self.inputMiles.text doubleValue];

    [self.view endEditing:YES];
   
    double myMPG = getMilesPerGallon(miles, litres);
    double myL100km = getL100km(miles, litres);
    //[buf appendString: [@(gallons) stringValue]];
    [buf appendFormat:@"%.2f   Miles/Gal\n\n%.2f   L/100km", myMPG, myL100km];
    
    self.reportOutput.text = buf;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
