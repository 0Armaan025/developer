<!DOCTYPE html>
<html dir="ltr" lang="<?php echo $page_data->language;?>">
<head>
    <?php if(isset($header)) echo $header; ?>
    <meta charset="utf-8">
    <title><?php echo $page_data->title; ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="index,follow,noodp,noydir" />
    <meta name="description" content="">
    <meta name="author" content="2012 - <?php echo date('Y'); ?> <?php echo $page_data->title; ?>">
    <link href="<?php echo $page_data->pageurl;?>/css/default/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">body { padding-top: 60px;padding-bottom: 40px;}</style>
    <link href="<?php echo $page_data->pageurl;?>/css/default/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="<?php echo $page_data->pageurl;?>/css/default/easy-wi.css" rel="stylesheet">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" ></script>
    <script src="<?php echo $page_data->pageurl;?>/js/default/bootstrap.min.js"></script>
    <script src="<?php echo $page_data->pageurl;?>/js/default/footable.js" type="text/javascript"></script>
    <link rel="shortcut icon" href="<?php echo $page_data->pageurl;?>/images/favicon.ico" />
    <link rel="canonical" href="<?php echo $page_data->canurl;?>" />
    <?php if(isset($page_feeds)) echo $page_feeds; ?>

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="<?php echo $page_data->pageurl;?>/js/default/html5shiv.js"></script>
    <![endif]-->
    <script type="text/javascript">$(function() { $('table').footable();});</script>
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <p class="navbar-text pull-left">
                <?php foreach ($page_data->getLangLinks() as $l=>$v) { echo '<a href="'.$v.'"><img src="'.$page_data->pageurl.'/images/flags/'.$l.'.png" alt="Flag: '.$l.'.png."></a>';}?>
            </p>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Easy-WI.com<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="http://wiki.easy-wi.com" target="_blank" title="easy-wi.com wiki">Wiki</a></li>
                            <li><a href="https://easy-wi.com" target="_blank" title="free gameserver voiceserver dedicated and virtualserver webinterface easy-wi.com">About</a></li>
                            <li><a href="https://easy-wi.com/forum/" target="_blank" title="easy-wi.com forum">Forum</a></li>
                        </ul>
                    </li>
                </ul>
                <?php if (isset($admin_id) or isset($user_id)) { ?>
                <ul class="nav pull-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><?php echo $gsprache->welcome.$great_vname." ".$great_name;?><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><?php echo $gsprache->last.'<br />'.$great_last;?></a></li>
                            <li class="divider"></li>
                            <li><a href="<?php echo (isset($admin_id)) ? $page_data->url.'/admin.php' : $page_data->url.'/userpanel.php';?>">Backend</a></li>
                            <li class="divider"></li>
                            <?php if ($support_phonenumber!="") echo '<li><a href="#">'.$gsprache->hotline.": ".$support_phonenumber.'</a></li>';?>
                            <li class="divider"></li>
                            <li><a href="<?php echo $page_data->url;?>/login.php?w=lo">Logout</a></li>
                        </ul>
                    </li>
                </ul>
                <?php } else { ?>
                <div id="modal" class="navbar-form pull-right">
                    <a href="#myModal" role="button" class="btn" data-toggle="modal">Login</a>
                </div>
                <?php } ?>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>
<?php if (!isset($admin_id) and !isset($user_id)) { ?>
<!-- Modal -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <form action="<?php echo $page_data->pageurl;?>/login.php" method="post">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">Login</h3>
    </div>
    <div class="modal-body">
        <div class="control-group">
            <div class="controls">
                <label class="control-label" for="inputUser"></label>
                <div class="input-prepend">
                    <span class="add-on"><i class="icon-user"></i></span>
                    <input name="username" id="inputUser" type="text" class="input-block-level" placeholder="User/Email" required >
                </div>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <label class="control-label" for="inputPassword"></label>
                <div class="input-prepend">
                    <span class="add-on"><i class="icon-lock"></i></span>
                    <input name="password" id="inputPassword" type="password" class="input-block-level" placeholder="Password" required >
                </div>
            </div>
        </div>
        <?php if ($ewCfg['captcha']==1) { ?>
        <div class="control-group">
            <label class="control-label" for="inputCaptcha"></label>
            <div class="controls">
                <div class="input-prepend">
                    <span class="add-on"><img src="images.php" alt="Captcha" /></span>
                    <input name="captcha" id="inputCaptcha" type="text" class="input-block-level" placeholder="Captcha" pattern="^[\w]{4}$" required >
                </div>
            </div>
        </div>
        <div class="hide">
            <label><input type="text" name="email"></label>
        </div>
        <?php } ?>
    </div>
    <div class="modal-footer">
        <a class="btn pull-left btn-info" href="<?php echo $page_data->pages['register']['link'];?>"><?php echo $page_data->pages['register']['linkname'];?></a>
        <a class="btn pull-left" href="<?php echo $page_data->pageurl;?>/login.php?w=pr" >Lost PW</a>
        <button class="btn btn-primary pull-right">Login</button>
    </div>
    </form>
</div>
<?php } ?>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span3">
            <div class="well sidebar-nav">
                <ul class="nav nav-list">
                    <li class="nav-header"><?php echo $gsprache->overview;?></li>
                    <li <?php if($s=='search') echo 'class="active"';?>><?php echo $page_data->pages['search']['href'];?></li>
                    <li <?php if($s=='news') echo 'class="active"';?>><?php echo $page_data->pages['news']['href'];?></li>
                    <li <?php if($s=='about') echo 'class="active"';?>><?php echo $page_data->pages['about']['href'];?></li>
                    <li <?php if($s=='gallery') echo 'class="active"';?>><?php echo $page_data->pages['gallery']['href'];?></li>
                    <li <?php if($s=='imprint') echo 'class="active"';?>><?php echo $page_data->pages['imprint']['href'];?></li>
                    <li <?php if($s=='contact') echo 'class="active"';?>><?php echo $page_data->pages['contact']['href'];?></li>
                    <li <?php if($s=='downloads') echo 'class="active"';?>><?php echo $page_data->pages['downloads']['href'];?></li>
                    <?php if($page_data->protectioncheck=='Y'){ ?><li <?php if($s=='protectioncheck') echo 'class="active"';?>><?php echo $page_data->pages['protectioncheck']['href'];?></li><?php } ?>
                    <li class="divider"></li>
                    <?php if($page_data->lendactive=='Y'){ ?>
                    <li class="nav-header"><?php echo $page_data->pages['lendserver']['linkname'];?></li>
                    <li <?php if($s=='lendserver' and !isset($servertype)) echo 'class="active"';?>><?php echo $page_data->pages['lendserver']['href'];?></li>
                    <li <?php if(isset($servertype) and $servertype=='v') echo 'class="active"';?>><?php echo $page_data->pages['lendservervoice']['href'];?></li>
                    <li <?php if(isset($servertype) and $servertype=='g') echo 'class="active"';?>><?php echo $page_data->pages['lendservergs']['href'];?></li>
                    <li class="divider"></li>
                    <?php } ?>
                    <li class="nav-header"><?php echo $gsprache->pages;?></li>
                    <?php
function GetSubLinks($pagelist,$id,$sub=1){ global $page_id; $return='';if(isset($pagelist[$id])){foreach($pagelist[$id] as $k=>$sl){ if ($id!=$k){ $return.='<li'; if(isset($page_id) and $page_id==$k) $return.=' class="active"';  $return.='>';$return.=$sl['href'].'</li>';$return.=GetSubLinks($pagelist,$k,$sub+1);}}}return $return;}
foreach ($page_data->pages as $key=>$value){if(isid($key,'30')){ echo'<li'; if(isset($page_id) and $page_id==$key) echo ' class="active"';  echo '>'.$value[$key]['href'].'</li>';echo GetSubLinks($page_data->pages,$key);}}
                    ?>
                </ul>
            </div><!--/.well -->
        </div><!--/span-->
        <div class="span9">
            <?php if(isset($header)){ ?><div class="alert alert-block"><button type="button" class="close" data-dismiss="alert">&times;</button><?php echo $text; ?></div><?php } ?>