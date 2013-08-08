//
//  CLEViewController.m
//  CatalogoListaEmpresas
//
//  Created by Pedro Farias Barbosa on 03/08/13.
//  Copyright (c) 2013 Pedro Farias Barbosa. All rights reserved.
//

#import "CLEViewController.h"
#import "CLEEmpresa.h"

@interface CLEViewController ()

@end

@implementation CLEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadEmpresas];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
    return listaEmpresas.count;
}

-(void) loadEmpresas{
    NSString *plistCaminho = [[NSBundle mainBundle]
                              pathForResource:@"empresas" ofType:@"plist"];
    NSDictionary * pl =[NSDictionary dictionaryWithContentsOfFile:plistCaminho];
    NSArray *dados = [pl objectForKey:@"empresas"];
    listaEmpresas = [[NSMutableArray alloc]init];
    
    for(NSDictionary *item in dados){
        NSString *nome = [item objectForKey:@"nome"];
        NSString *quantidadeFuncionarios = [item objectForKey:@"quantidadeFuncionarios"];
        
        CLEEmpresa *e = [[CLEEmpresa alloc] initWithName:nome
                                      andQuantidade:quantidadeFuncionarios];
        [listaEmpresas addObject:e];
        [e release];
    }
}

-(UITableViewCell *) tableView:(UITableView *)tableView
       cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CelulaEmpresaCacheID = @"CelulaEmpresaCacheID";
    UITableViewCell *cell = [self.tabelaEmpresas
                           dequeueReusableCellWithIdentifier:CelulaEmpresaCacheID];
    if(!cell){
        cell = [[[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CelulaEmpresaCacheID] autorelease];
        CLEEmpresa *empresa = [listaEmpresas objectAtIndex:indexPath.row];
        cell.textLabel.text = empresa.nome;
    }
    return cell;
}

- (void)dealloc {
    [_tabelaEmpresas release];
    [super dealloc];
}
@end
